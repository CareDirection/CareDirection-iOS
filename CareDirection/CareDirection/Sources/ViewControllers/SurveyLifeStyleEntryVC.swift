//
//  SurveyLifeStyleEntryVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleEntryVC: UIViewController {
    @IBOutlet var nextBtn: UIButton!
    var name:String!
    var lifeCylcleBody: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveyLifeStyleFirstPoint = UIStoryboard.init(name: "SurveyLifeStyleFirstPoint", bundle: nil)
        let dvc = surveyLifeStyleFirstPoint.instantiateViewController(withIdentifier: "SurveyLifeStyleFirstPointVC") as! SurveyLifeStyleFirstPointVC
        
        dvc.modalPresentationStyle = .fullScreen
        dvc.userName = self.name
        dvc.lifeCylcleBody = self.lifeCylcleBody
        self.present(dvc, animated: true)
    }
}
