//
//  SurveyLifeStyleFirstPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleFirstPointVC: UIViewController {
    
    var userName: String = "박진오"
    var isSmoking: Bool?
    var isDrink: Bool?
    
    // name Label
    @IBOutlet var nameLbl1: UILabel!
    @IBOutlet var nameLbl2: UILabel!
    
    // next Button
    @IBOutlet var nextBtn: UIButton!
    
    // cigar answer Button
    @IBOutlet var cigarYesAnswerBtn: UIButton!
    @IBOutlet var cirgarNoAnswerBtn: UIButton!
    
    // drink answer Button
    @IBOutlet var drinkYesAnswerBtn: UIButton!
    @IBOutlet var drinkNoAnswerBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        var isSmokingSelected: Bool = false
        var isDringkingSelected: Bool = false
        
        nameLbl1.text = "\(userName)님은"
        nameLbl2.text = "\(userName)님은"
        
        nextBtn.makeRounded(cornerRadius: 25)
        
        
        if let smokingResult = isSmoking{
            if smokingResult == true{
                cigarYesAnswerBtn.isSelected = true
                cirgarNoAnswerBtn.isSelected = false
            }
            else{
                cigarYesAnswerBtn.isSelected = false
                cirgarNoAnswerBtn.isSelected = true
            }
            isSmokingSelected = true
        }
        if let dringkingResult = isDrink{
            if dringkingResult == true{
                drinkYesAnswerBtn.isSelected = true
                drinkNoAnswerBtn.isSelected = false
            }
            else {
                drinkYesAnswerBtn.isSelected = false
                drinkNoAnswerBtn.isSelected = true
            }
            isDringkingSelected = true
        }
        
        if isSmokingSelected && isDringkingSelected{
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
        else{
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = UIColor.white40
            nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        }
        
    }
    @IBAction func selectedYesSmoking(_ sender: UIButton) {
        let button = sender
        switch button.tag {
        case 0:
            self.isSmoking = true
        case 1:
            self.isSmoking = false
        case 2:
            self.isDrink = true
        case 3:
            self.isDrink = false
        default:
            break
        }
        setLayout()
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveyLifeStyleSecondPoint = UIStoryboard.init(name: "SurveyLifeStyleSecondPoint", bundle: nil)
        let dvc = surveyLifeStyleSecondPoint.instantiateViewController(withIdentifier: "SurveyLifeStyleSecondPointVC") as! SurveyLifeStyleSecondPointVC
        
        
        dvc.modalPresentationStyle = .fullScreen
        dvc.name = self.userName
        self.present(dvc, animated: true)
        
    }
    
    
}
