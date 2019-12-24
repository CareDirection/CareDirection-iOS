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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.makeRounded(cornerRadius: 24.5)
        
    
        nameTextField.attributedPlaceholder = NSAttributedString(string: "선호하는 애칭이나 별명을 적어주세요.",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white40])

    }
    
    // textField 입력 시 버튼 색상 변경
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        nextButton.layer.backgroundColor = UIColor.white.cgColor
        nextText.textColor = UIColor.topaz
    }
    

}
