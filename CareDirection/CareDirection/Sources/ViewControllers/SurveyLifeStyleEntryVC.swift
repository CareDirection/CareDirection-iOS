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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
    }
    
}
