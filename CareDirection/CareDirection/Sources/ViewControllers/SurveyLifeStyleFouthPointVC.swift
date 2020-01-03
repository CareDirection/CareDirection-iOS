//
//  SurveyLifeStyleFouthPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/29.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleFouthPointVC: UIViewController {

    @IBOutlet var answerOneBtn: UIButton!
    
    @IBOutlet var answerTwoBtn: UIButton!
    
    @IBOutlet var answerThreeBtn: UIButton!
    
    
    @IBOutlet var nextBtn: UIButton!
    
    var selectedAnswer: Int?
    let answerList:[String] = ["4회 이상", "2회 ~ 3회", "1회 이하"]
    var lifeCylcleBody: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
        nextBtn.backgroundColor = UIColor.white40
        nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        nextBtn.isEnabled = false
    }
    
    func setDynamicLayout(){
        switch selectedAnswer {
        case 0:
            self.answerOneBtn.isSelected = true
            self.answerTwoBtn.isSelected = false
            self.answerThreeBtn.isSelected = false
        case 1:
            self.answerOneBtn.isSelected = false
            self.answerTwoBtn.isSelected = true
            self.answerThreeBtn.isSelected = false
        case 2:
            self.answerOneBtn.isSelected = false
            self.answerTwoBtn.isSelected = false
            self.answerThreeBtn.isSelected = true
        default:
            break
        }
        nextBtn.isEnabled = true
        nextBtn.backgroundColor = UIColor.white
        nextBtn.setTitleColor(UIColor.topaz, for: .normal)
    }
    func resultToString(){
        self.lifeCylcleBody.append(answerList[selectedAnswer!])
    }
    
    @IBAction func selectedAnswer(_ sender: UIButton){
        selectedAnswer = sender.tag
        setDynamicLayout()
    }
    
    @IBAction func nextBtnSelected(_ sender: Any) {
        let surveyLastPoint = UIStoryboard.init(name: "SurveyLifeStyleLastPoint", bundle: nil)
        let dvc = surveyLastPoint.instantiateViewController(withIdentifier: "SurveyLifeStyleLastPoint") as! SurveyLifeStyleLastPointVC
        resultToString()
        dvc.lifeCylcleBody = self.lifeCylcleBody
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    
    }
    
}
