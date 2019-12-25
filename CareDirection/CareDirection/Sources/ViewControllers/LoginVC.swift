//
//  LoginVC.swift
//  CareDirection
//
//  Created by 안재은 on 25/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var idView: UIView!
    
    @IBOutlet weak var pwView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //id, pw textfield customize
        idTextField.attributedPlaceholder = NSAttributedString(string: "아이디",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.veryLightPink])
        idView.makeRounded(cornerRadius: 23.5)
        pwTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.veryLightPink])
        pwView.makeRounded(cornerRadius: 23.5)
        
        //login button customize
        loginButton.makeRounded(cornerRadius: 23.5)
        loginButton.backgroundColor = UIColor.lightTan
        
        //sign up button customize
        signUpButton.setTitleColor(UIColor.lightTan, for: .normal)
        
        
    }
    
    //login button clicked
    @IBAction func loginButtonClicked(_ sender: Any) {
        
    }
    //signup button clicked
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
    }
}
