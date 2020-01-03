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
    
    @IBOutlet weak var viewYCenter: NSLayoutConstraint!
    
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
        
        initGestureRecognizer()
        
        
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
    // 키보드 제어하는 메소드
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }

}

extension LoginVC : UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: idTextField))! || (touch.view?.isDescendant(of: pwTextField))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서 발생한다.
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            //self.logoImgView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.viewYCenter.constant = -keyboardHeight/2 + 50
        })
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            //self.logoImgView.alpha = 1.0
            self.viewYCenter.constant = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
