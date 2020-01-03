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
        // navigation bar drop shadow
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
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
        self.dismiss(animated: true)
    }
    
    // 중복확인 버튼 액션
    @IBAction func repeatCheckButtonClicked(_ sender: Any) {
        
        guard let id = self.emailTextField.text else {return}
        
        AuthService.shared.idDoubleCheck(id){
            data in
            switch data {
                
            case .success :
                
                print("사용가능한 id")
                self.simpleAlert(title: "사용 가능한 아이디", message: "사용 가능한 ID 입니다.")
                
            case .requestErr(_):
                self.simpleAlert(title: "회원가입 실패", message: "실패 메세지요!")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "회원가입 실패", message: "네트워크 상태를 확인해주세요.")
                
            case .dbErr:
                print(".dbErr")
                
            }
        }
        
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
                
            case .dbErr:
                print(".dbErr")
                
            }
        }
        //}
    }
}
