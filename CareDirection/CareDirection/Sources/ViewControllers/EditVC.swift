//
//  EditVC.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var idEditTextField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finishButton.makeRounded(cornerRadius: 6)
        finishButton.backgroundColor = UIColor.tealBlue
        
        idEditTextField.makeRounded(cornerRadius: 6)
        idEditTextField.setBorder(borderColor: UIColor.veryLightPink, borderWidth: 1)
        
    }
    
    // back button clicked
    @IBAction func backButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // finish button clicked
    @IBAction func finishButtonClicked(_ sender: Any) {
    
        // 수정된 정보 서버에 보내주기!
        self.dismiss(animated: true)
        
        
    }
        
}
