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
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.makeRounded(cornerRadius: 25)
    }
    

    @IBAction func selectNextBtn(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "AfterSurveyResgistTakingProduct", bundle: nil)
        let dvc = storyboard.instantiateViewController(identifier: "AfterSurveyResgistTakingProduct") as! AfterSurveyResgistTakingProductVC
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
    

}
