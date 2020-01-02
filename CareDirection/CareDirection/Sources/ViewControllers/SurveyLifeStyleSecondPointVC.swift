//
//  SurveyLifeStyleSecondPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleSecondPointVC: UIViewController {
    var name: String = "박진오"
    @IBOutlet var nameLbl: UILabel!
    
    var isSelectVegetableTimes: Bool = false
    var selectedIndex: Int?
    let answerList:[String] = ["4시간 이상", "1시간 ~ 4시간", "1시간 이하"]
    var lifeCylcleBody: [String] = []
    
    //answer Button
    @IBOutlet var answerBtn0: UIButton!
    @IBOutlet var answerBtn1: UIButton!
    @IBOutlet var answerBtn2: UIButton!
    
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "\(name)님은"
        setLayout()

        // Do any additional setup after loading the view.
    }
    

    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
        
        if isSelectVegetableTimes{
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
        else{
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = UIColor.white40
            //nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        }
        
        if let result = selectedIndex{
            switch result {
            case 0:
                answerBtn0.isSelected = true
                answerBtn1.isSelected = false
                answerBtn2.isSelected = false
            case 1:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = true
                answerBtn2.isSelected = false

            case 2:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = false
                answerBtn2.isSelected = true
            case 3:
                answerBtn0.isSelected = false
                answerBtn1.isSelected = false
                answerBtn2.isSelected = false
            default:
                break
            }
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
    }
    
    func resultToString(){
        self.lifeCylcleBody.append(answerList[selectedIndex!])
    }
    
    @IBAction func selectedAnswer(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        
        setLayout()
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveyLifeStyleThirdPointSB = UIStoryboard.init(name: "SurveyLifeStyleThirdPoint", bundle: nil)
        let dvc = surveyLifeStyleThirdPointSB.instantiateViewController(withIdentifier: "SurveyLifeStyleThirdPointVC") as! SurveyLifeStyleThirdPointVC
        resultToString()
        
        dvc.name = self.name
        dvc.lifeCylcleBody = self.lifeCylcleBody
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
    
}
