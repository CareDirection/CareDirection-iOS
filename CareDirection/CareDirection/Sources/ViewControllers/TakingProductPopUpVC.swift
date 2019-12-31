//
//  TakingProductPopUpVC.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductPopUpVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.makeRounded(cornerRadius: 21)
    }

    //취소 버튼 클릭 시
    @IBAction func cancleButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // 복용, 복용 취소 체크 버튼
    // 버튼에 따른 복용여부 체크 이미지 변화주기
    @IBAction func takeButtonClick(_ sender: Any) {
        
        // 이미지 변화주기
        
        // 버튼 텍스트 변화주기
        
        // 뷰 내려주기
        self.dismiss(animated: true)
    }
    
    
    
}
