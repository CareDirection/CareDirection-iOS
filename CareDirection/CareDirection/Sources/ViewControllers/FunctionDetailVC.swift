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
    
    @IBOutlet weak var functionalLabel: UILabel!
    @IBOutlet weak var functionalLabel2: UILabel!
    
    
    var functionalIngredientList : [FunctionalEfficacy] = []
    var functionalIngredientList2 : [FunctionalIngredient] = []
    var symptomList : [Symptom] = []
    var functionalIngredient : [FunctionalNutrient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationBar.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
        setIngredient()
        
        setSymptom()
        
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
        dvc.tabIndex = 0
        present(dvc, animated: true)
        
    }
    
    @IBAction func fatigueButton(_ sender: Any) {let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        present(dvc, animated: true)
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func bloodButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func immunityButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func digestButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func brainButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func muscleButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
        present(dvc, animated: true)
    }
    
    @IBAction func boneButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = 0
        
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
            
            var imgName = ""
            
            //cell.imageView.image = ingredient.ingredientImage
            cell.label.text = ingredient.efficacy_name
            
            if ingredient.efficacy_name == "면역력ㆍ항산화" {
                imgName = "levelOfImmunity60"
            } else if ingredient.efficacy_name == "간건강" {
                imgName = "liver60"
            } else if ingredient.efficacy_name == "피로회복" {
                imgName = "fatigueRecovery60"
            } else if ingredient.efficacy_name == "눈건강" {
                imgName = "eye60"
            } else if ingredient.efficacy_name == "혈행개선" {
                imgName = "improvement60"
            } else if ingredient.efficacy_name == "소화기능" {
                imgName = "digest60"
            } else if ingredient.efficacy_name == "두뇌활동" {
                imgName = "brain60"
            } else if ingredient.efficacy_name == "운동보조" {
                imgName = "health60"
            } else if ingredient.efficacy_name == "뼈" {
                imgName = "bone60"
            }
            
            cell.imageView.image = UIImage(named: imgName)
            
            print("이미지 이름" + ingredient.efficacy_name)
            
        
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
        
        NutrientService.shared.showNutrient() {
            [weak self]
            data in
            guard let `self` = self else { return }
            
            switch data {
            case .success(let res) :
                
                self.functionalIngredient = res as! [FunctionalNutrient]
                
                self.functionalLabel.text = self.functionalIngredient[0].nutrient
                //self.functionalLabel2.text = self.functionalIngredient[1].nutrient
                self.functionalIngredientList = self.functionalIngredient[0].efficacy!
                //self.functionalIngredientList2 = self.functionalIngredient[1].efficacy
                self.functionalCollectionView.dataSource = self
                self.functionalCollectionView.reloadData()
                
            case .requestErr(let msg):
                print("nutrient : request err")
            case .pathErr:
                print("nutrient : path err")
            case .serverErr:
                print("nutrient : server err")
            case .networkFail:
                print("nutrient : network fail")
            case .dbErr:
                print("nutrient : db err")
            }
        }
        
        
    }
    
    func setSymptom() {
        let symptom1 = Symptom(category: "마카", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        let symptom2 = Symptom(category: "종합비타민", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        let symptom3 = Symptom(category: "마카", image: "", detail: "만성피로에 시달리는 현대인들.\n비타민 C는 기본이고,\n온갖 종류의 영양제와\n함께 살고 있습니다.\n하지만!\n\n음식에도 안 맞는 궁합이 있듯이\n영양제를 잘못 먹으면\n제 효과를 보지 못하거나\n독이 될 수도 있다는데요.")
        
        symptomList = [symptom1, symptom2, symptom3]
    }
}
