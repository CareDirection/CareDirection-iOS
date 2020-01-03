//
//  SurveyLifeStyleThirdPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleThirdPointVC: UIViewController {
    
    var selectedIndex: Int?
    var answerList:[String] = ["7회 이상", "5회 ~ 6회", "3회 ~ 4회", "2회 이하"]
    var name: String = "박진오"
    var lifeCylcleBody: [String] = []
    
    @IBOutlet var nameLbl: UILabel!
    
    @IBOutlet var answerBtn0: UIButton!
    @IBOutlet var answerBtn1: UIButton!
    @IBOutlet var answerBtn2: UIButton!
    @IBOutlet var answerBtn3: UIButton!
    
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
        nameLbl.text = "\(name)님은"
        if let result = selectedIndex{
            switch result {
            case 0:
                answerBtn0.isSelected = true
                answerBtn1.isSelected = false
                answerBtn2.isSelected = false
                answerBtn3.isSelected = false
            case 1:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = true
                answerBtn2.isSelected = false
                answerBtn3.isSelected = false
            case 2:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = false
                answerBtn2.isSelected = true
                answerBtn3.isSelected = false
            case 3:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = false
                answerBtn2.isSelected = false
                answerBtn3.isSelected = true
            default:
                break
            }
            
            nextBtn.isEnabled = true
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
            nextBtn.backgroundColor = UIColor.white
        }
    }
    
    func resultToString(){
        self.lifeCylcleBody.append(answerList[selectedIndex!])
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        selectedIndex = sender.tag
        setLayout()
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveyLifeStyleFouthPoint = UIStoryboard.init(name: "SurveyLifeStyleFouthPoint", bundle: nil)
        let dvc = surveyLifeStyleFouthPoint.instantiateViewController(withIdentifier: "SurveyLifeStyleFouthPointVC") as! SurveyLifeStyleFouthPointVC
        resultToString()
        
        dvc.modalPresentationStyle = .fullScreen
        dvc.lifeCylcleBody = self.lifeCylcleBody
        
        dvc.name = self.name
        
        self.present(dvc, animated: true)
    }
    
}
