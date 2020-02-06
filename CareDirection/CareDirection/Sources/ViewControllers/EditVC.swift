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
    
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var idLbl: UILabel!
    
    var name : String = ""
    var age : String = ""
    var id : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finishButton.makeRounded(cornerRadius: 6)
        finishButton.backgroundColor = UIColor.tealBlue
        
        idEditTextField.makeRounded(cornerRadius: 6)
        idEditTextField.setBorder(borderColor: UIColor.veryLightPink, borderWidth: 1)
        
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
        let user = UserDefaults.standard
        
        name = user.string(forKey: "user_name")!
        self.ageLbl.text = user.string(forKey: "user_age")!
        self.ageLbl.text = user.string(forKey: "user_age")!
        self.idLbl.text = user.string(forKey: "user_name")
        
        nickname.attributedPlaceholder = NSAttributedString(string: name,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white40])
        
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
