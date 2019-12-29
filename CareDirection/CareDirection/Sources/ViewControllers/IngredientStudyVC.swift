//
//  IngredientStudyVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class IngredientStudyVC: UIViewController {
    
    // 전체적인 view block 들
    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var ingredientDetailView: UIView!
    
    @IBOutlet weak var symptomView: UIView!
    
    @IBOutlet weak var articleView: UIView!
    
    
    // 성분 collection view
    @IBOutlet weak var ingredientCollectionView: UICollectionView!
    // 아티클 collection view
    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    // 성분 리스트
    var ingredientList : [Ingredient] = []
    
    // 아티클 리스트
    var articleList : [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전체적인 view block들 customize
        navigationBar.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        ingredientDetailView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        symptomView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        articleView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        
        // collection view 에 세팅될 더미 데이터들
        //1. ingredient
        setIngredient()
        //2. article
        setArticle()
        
    }
    
}

// 성분 collection view datasource
extension IngredientStudyVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.articleCollectionView {
            return articleList.count
        }
        return ingredientList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.articleCollectionView {
            let cell = articleCollectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticleCell
            
            let article = articleList[indexPath.row]
            
            cell.articleImage.image = article.articleImage
            cell.articleTitleLabel.text = article.articleTitle
            
            return cell
        } else {
            let cell = ingredientCollectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! IngredientStudyCell
            
            let ingredient = ingredientList[indexPath.row]
            
            cell.ingredientImage.image = ingredient.ingredientImage
            
            return cell
        }
    }
}

// collection view delegate
extension IngredientStudyVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.ingredientCollectionView {
            let recordStoryboard = UIStoryboard.init(name: "Ingredient", bundle: nil)
            guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "IngredientDetailVC") as? IngredientDetailVC else {
                return
            }
            let ingredient = ingredientList[indexPath.row]
            
            self.present(dvc, animated: true)
            
        } else {
            let recordStoryboard = UIStoryboard.init(name: "Article", bundle: nil)
            guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "ArticleDetailVC") as? ArticleDetailVC else {
                return
            }
            
            let article = articleList[indexPath.row]
            
            //dvc.articleTitleLabel.text = article.articleTitle
            self.present(dvc, animated: true)
        }
    }
}

extension IngredientStudyVC {
    func setIngredient() {
        let ingredient1 = Ingredient(image: "hongsam")
        let ingredient2 = Ingredient(image: "omega")
        let ingredient3 = Ingredient(image: "milk")
        let ingredient4 = Ingredient(image: "lutain")
        let ingredient5 = Ingredient(image: "you")
        let ingredient6 = Ingredient(image: "vita")
        
        ingredientList = [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6]
    }
    
    func setArticle() {
        let article1 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지")
        let article2 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지")
        let article3 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지")
        let article4 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지")
        
        articleList = [article1, article2, article3, article4]
        
    }
}
