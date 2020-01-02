//
//  SurveyLifeStyleLastPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleLastPointVC: UIViewController {

    @IBOutlet var nextBtn: UIButton!
    var lifeCylcleBody: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(lifeCylcleBody)
        nextBtn.makeRounded(cornerRadius: 25)
    }
    

    @IBAction func selectNextBtn(_ sender: Any) {
        SurveyService.shared.lifeStyleInfo(
            answer1: lifeCylcleBody[0],
            answer2: lifeCylcleBody[1],
            answer3: lifeCylcleBody[2],
            answer4: lifeCylcleBody[3],
            answer5: lifeCylcleBody[4],
            answer6: lifeCylcleBody[5],
            answer7: lifeCylcleBody[6]) { data in
                switch data {
                case .success(let msg):
                    print(msg)
                    let storyboard = UIStoryboard.init(name: "AfterSurveyResgistTakingProduct", bundle: nil)
                    let dvc = storyboard.instantiateViewController(identifier: "AfterSurveyResgistTakingProduct") as! AfterSurveyResgistTakingProductVC
                    
                    dvc.modalPresentationStyle = .fullScreen
                    self.present(dvc, animated: true)
                case .requestErr(let msg):
                    print(msg)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("network fail")
                case .dbErr:
                    print("dbERR")
                }
        }
        
        
    }
}

