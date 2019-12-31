//
//  TakingProductInfoVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/30.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductInfoVC: UIViewController {
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var takingUsageLbl: UILabel!
    
    @IBOutlet var predictedTakingQuantityPerDayView: UIView!
    @IBOutlet var predictedTakingQuantityPerDayTxtField: UITextField!
    
    @IBOutlet var takingStartDayView: UIView!
    @IBOutlet var takingStartDayTxtField: UITextField!
    
    @IBOutlet var takingAlarmSettingView: UIView!
    @IBOutlet var takingAlarmSettingTxtField: UITextField!
    
    @IBOutlet var registBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitLayout()
        // Do any additional setup after loading the view.
    }
    func setInitVar(){
        
    }
    func setInitLayout(){
        self.predictedTakingQuantityPerDayView.makeRounded(cornerRadius: 8)
        self.takingStartDayView.makeRounded(cornerRadius: 8)
        self.takingAlarmSettingView.makeRounded(cornerRadius: 8)
        
        self.registBtn.makeRounded(cornerRadius: 25)
    }
    
    @IBAction func selectedRegistBtn(_ sender: Any) {
        
    }
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension TakingProductInfoVC: UITextFieldDelegate{
    
}
