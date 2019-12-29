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
    var name: String = "박진오"
    
    @IBOutlet var nameLbl: UILabel!
    
    @IBOutlet var answerBtn0: UIButton!
    @IBOutlet var answerBtn1: UIButton!
    @IBOutlet var answerBtn2: UIButton!
    
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
        
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
            default:
                break
            }
            
            nextBtn.isEnabled = true
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
            nextBtn.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        selectedIndex = sender.tag
        setLayout()
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveyLifeStyleFouthPoint = UIStoryboard.init(name: "SurveyLifeStyleFouthPoint", bundle: nil)
        let dvc = surveyLifeStyleFouthPoint.instantiateViewController(withIdentifier: "SurveyLifeStyleFouthPointVC") as! SurveyLifeStyleFouthPointVC
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
    
}
