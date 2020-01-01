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
        
        guard let id = idTextField.text else {return}
        guard let pw = pwTextField.text else {return}
        
        AuthService.shared.login(id, pw) {
            data in
            
            switch data {
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰
                let token = user_data.token
                UserDefaults.standard.set(token, forKey: "token")
                
                let survey = UIStoryboard.init(name: "Survey", bundle: nil)
                
                guard let dvc = survey.instantiateViewController(withIdentifier: "SurveyVC") as? SurveyVC else {
                  return
                }
                
                self.present(dvc, animated: true)
                
            case .requestErr(let message):
                self.simpleAlert(title: "로그인 실패", message: "\(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("네트워크 오류")
                
            case .dbErr:
                print("디비 에러")
            }
        }
    }


//signup button clicked
@IBAction func signUpButtonClicked(_ sender: Any) {
    
    let storyboardSignup = UIStoryboard.init(name: "Signup", bundle: nil)
    
    guard let dvc = storyboardSignup.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC else {
        return
    }
    
    present(dvc, animated: true)
    
}

}
