//
//  SurveyLifeStyleFouthPointVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/29.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyLifeStyleFouthPointVC: UIViewController {

    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        nextBtn.makeRounded(cornerRadius: 25)
        nextBtn.backgroundColor = UIColor.white40
        nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        nextBtn.isEnabled = true
    }
    

}
