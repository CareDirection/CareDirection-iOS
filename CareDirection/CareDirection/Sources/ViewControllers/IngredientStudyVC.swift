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
    
    var symptomList : [Symptom] = []
    
    
    
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
        //3. 증상 : 이거 리스트 안에 리스트로 처리해줘야함!!
        setSymptom()
        
    }
    
    @IBAction func liverButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func fatigueButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[1]
        
        present(dvc, animated: true)
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[2]
        
        present(dvc, animated: true)
    }
    
    @IBAction func bloodButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[3]
        
        present(dvc, animated: true)
    }
    
    @IBAction func immunityButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[4]
        
        present(dvc, animated: true)
    }
    
    @IBAction func digestButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[5]
        
        present(dvc, animated: true)
    }
    
    @IBAction func brainButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[6]
        
        present(dvc, animated: true)
    }
    
    @IBAction func muscleButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[7]
        
        present(dvc, animated: true)
    }
    
    @IBAction func boneButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        //dvc.symptomList = symptomList[8]
        
        present(dvc, animated: true)
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
            
            //let ingredient = ingredientList[indexPath.row]
            
            dvc.detailList = ingredientList[indexPath.row]

            self.present(dvc, animated: true)
            
        } else {
            let recordStoryboard = UIStoryboard.init(name: "Article", bundle: nil)
            guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "ArticleDetailVC") as? ArticleDetailVC else {
                return
            }
            
            dvc.articleList = articleList[indexPath.row]
            
            self.present(dvc, animated: true)
        }
    }
}

extension IngredientStudyVC {
    func setIngredient() {
        let ingredient1 = Ingredient(image: "hongsam", detailImage: "flickrMarcoVerch", name: "홍삼", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고, 온갖 종류의 영양제와 함께 살고 있습니다.\n하지만! 음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면 제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        let ingredient2 = Ingredient(image: "omega", detailImage: "", name: "오메가3", detail: "")
        let ingredient3 = Ingredient(image: "milk", detailImage: "", name: "밀크시슬", detail: "")
        let ingredient4 = Ingredient(image: "lutain", detailImage: "", name: "루테인", detail: "")
        let ingredient5 = Ingredient(image: "you", detailImage: "", name: "유산균", detail: "")
        let ingredient6 = Ingredient(image: "vita", detailImage: "", name: "비타민", detail: "")
        
        ingredientList = [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6]
    }
    
    func setArticle() {
        let article1 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지", detailImage: "", detailContent: "", detailContentTitle: "", detailContentImage: "", detailContentPara: "")
        let article2 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지", detailImage: "", detailContent: "", detailContentTitle: "", detailContentImage: "", detailContentPara: "")
        let article3 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지", detailImage: "", detailContent: "", detailContentTitle: "", detailContentImage: "", detailContentPara: "")
        let article4 = Article(image: "flickrMarcoVerch", title: "함께 먹었다가 ‘독’ 되는 영양제 궁합 8가지", detailImage: "flickrMarcoVerch", detailContent: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고, 온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이 영양제를 잘못 먹으면\n제 효과를 보지 못하거나 독이 될 수도 있다는데요.", detailContentTitle: "감기예방에 좋은 비타민 C", detailContentImage: "flickrMarcoVerch", detailContentPara: "감기약 방부제로 사용되는 벤조산나트륨이 비타민C를\n만나면 인체에 해로운 성분이 발생할 수 있습니다.\n가능성이 작다고는 하지만 따로 먹는 것이 좋겠죠?")
        
        articleList = [article1, article2, article3, article4]
        
    }
    
    func setSymptom() {
        let symptom1 = Symptom(category: "마카", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        let symptom2 = Symptom(category: "종합비타민", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        let symptom3 = Symptom(category: "마카", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        symptomList = [symptom1, symptom2, symptom3]
    }
}
