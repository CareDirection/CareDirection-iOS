//
//  SurveyVC.swift
//  CareDirection
//
//  Created by 안재은 on 24/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyVC: UIViewController {

   @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nextText: UILabel!
    
    @IBOutlet weak var viewYCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        // for keyboard animation
        initGestureRecognizer()
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "선호하는 애칭이나 별명을 적어주세요.",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white40])

    }
    
    func setLayout() {
        nextButton.isEnabled = false
        nextButton.backgroundColor = UIColor.white40
        nextText.textColor = UIColor.white40
        nextButton.makeRounded(cornerRadius: 24.5)
    }
    
    // textField 입력 시 버튼 색상 변경
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        nextButton.isEnabled = true
        nextButton.layer.backgroundColor = UIColor.white.cgColor
        nextText.textColor = UIColor.topaz
    }
    
    
    @IBAction func nextBtnSelected(_ sender: Any) {
        let surveyInfoSB = UIStoryboard.init(name: "SurveyInfo", bundle: nil)
        
        guard let dvc = surveyInfoSB.instantiateViewController(withIdentifier: "SurveyInfoVC") as? SurveyInfoVC else {
          return
        }
        
        
        dvc.userName = nameTextField.text
        dvc.modalPresentationStyle = .fullScreen

        
        self.present(dvc, animated: true)
    }
    
    // 키보드 제어하는 메소드
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
}

extension SurveyVC : UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.nameTextField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: nameTextField))! {
            
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
