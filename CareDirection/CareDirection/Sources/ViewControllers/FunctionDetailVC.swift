//
//  FunctionDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 28/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class FunctionDetailVC: UIViewController {

    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var functionalCollectionView: UICollectionView!
    
    @IBOutlet weak var functionalCollectionView2: UICollectionView!
    
    @IBOutlet weak var caringFunctionView: UIView!
    
    @IBOutlet weak var allFunctionView: UIView!
    
    
    var functionalIngredientList : [FunctionalIngredient] = []
    var functionalIngredientList2 : [FunctionalIngredient] = []
    var symptomList : [Symptom] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationBar.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
        setIngredient()
        
        
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
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
    
    @IBAction func fatigueButton(_ sender: Any) {let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func bloodButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func immunityButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func digestButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func brainButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func muscleButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
    @IBAction func boneButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.categoryList = symptomList
        print("성분학습 뷰:")
        print(symptomList)
        
        present(dvc, animated: true)
    }
    
}


extension FunctionDetailVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.functionalCollectionView{
            return functionalIngredientList.count
        } else {
            return functionalIngredientList2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.functionalCollectionView {
        
            let cell = functionalCollectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! FunctionalIngredientCell
            
            let ingredient = functionalIngredientList[indexPath.row]
            
        
            cell.imageView.image = ingredient.ingredientImage
            cell.label.text = ingredient.ingredientName
        
        if indexPath.row == functionalIngredientList.count - 1 {
            cell.endCircleView.isHidden = false
        }
        
        
            return cell
        } else {
            let cell = functionalCollectionView2.dequeueReusableCell(withReuseIdentifier: "ingredientCell2", for: indexPath) as! FunctionalIngeredientCell2
                
                let ingredient = functionalIngredientList2[indexPath.row]
                
            
                cell.imageView.image = ingredient.ingredientImage
                cell.label.text = ingredient.ingredientName
            
            if indexPath.row == functionalIngredientList2.count - 1 {
                cell.endCircleView.isHidden = false
            }
            
            
                return cell
        }
    
    }
}

extension FunctionDetailVC {
    func setIngredient() {
        let ingredient1 = FunctionalIngredient(image: "liver60", name: "간건강")
        let ingredient2 = FunctionalIngredient(image: "liver60", name: "면역력")
        let ingredient3 = FunctionalIngredient(image: "liver60", name: "피로회복")
        
        functionalIngredientList = [ingredient1, ingredient2, ingredient3]
        
        functionalIngredientList2 = [ingredient1, ingredient2]
    }
}
