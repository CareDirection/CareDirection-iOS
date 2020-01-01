//
//  SignupVC.swift
//  CareDirection
//
//  Created by 안재은 on 25/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var pwCheckView: UIView!
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    @IBOutlet weak var repeatCheckButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar 역할하는 뷰 커스터마이즈
        navigationBar.dropShadow(color: UIColor.black, offSet: CGSize(width: 1, height: 0), opacity: 0.1, radius: 3)
        
        // email textfield customize
        emailView.setBorder(borderColor: UIColor.brownishGrey30, borderWidth: 1)
        emailView.makeRounded(cornerRadius: 6)
        // password textfield customize
        pwView.setBorder(borderColor: UIColor.brownishGrey30, borderWidth: 1)
        pwView.makeRounded(cornerRadius: 6)
        // password check textfield customize
        pwCheckView.setBorder(borderColor: UIColor.brownishGrey30, borderWidth: 1)
        pwCheckView.makeRounded(cornerRadius: 6)
        // 중복확인 버튼 customize
        repeatCheckButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 0.5)
        repeatCheckButton.makeRounded(cornerRadius: 6)
        // 가입하기 버튼 customize
        //signUpButton.layer.backgroundColor = UIColor.tealBlue40.cgColor
        signUpButton.makeRounded(cornerRadius: 8)
    }
    
    // 뒤로가기 버튼 액션 : 추후 dismiss 로
    @IBAction func backButtonClicked(_ sender: Any) {
        
    }
    
    // 중복확인 버튼 액션
    @IBAction func repeatCheckButtonClicked(_ sender: Any) {
    }
    
    @IBAction func pwCheckAction(_ sender: UITextField) {
        signUpButton.layer.backgroundColor = UIColor.tealBlue.cgColor
        signUpButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    // 가입하기 버튼 액션
    // 가입하기 누르고 설문조사로 넘어감
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        
        guard let id = self.emailTextField.text else {return}
        guard let pw = self.pwTextField.text else {return}
        guard let pwCheck = self.pwCheckTextField.text else {return}
        
        //if pw == pwCheck {
        
        AuthService.shared.signup(id, pw) {
            data in
            switch data {
                
            case .success :
                print("회원가입 성공!")
                self.dismiss(animated: true, completion: nil)
                
            case .requestErr(_):
                self.simpleAlert(title: "회원가입 실패", message: "실패 메세지요!")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "회원가입 실패", message: "네트워크 상태를 확인해주세요.")
                
            }
        }
        //}
    }
}
