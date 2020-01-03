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
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var productImg: UIImageView!
    @IBOutlet var productRestCount: UILabel!
    
    @IBOutlet var productTakeUsage: UILabel!
    @IBOutlet var productAlarmLbl: UILabel!
    
    @IBOutlet var dosedBtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    
    var productIdx: Int!
    var isDosed: Bool = true
    var productPopUpData: [TakingProductPopUpData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.makeRounded(cornerRadius: 21)
        
        setData()
        setLayout()
    }
    
    func setData(){
        ProductManagementService.shared.getTakingProductInfoAtPopUp(idx: self.productIdx)  { data in
            switch data {
            case .success(let data):
                self.productPopUpData = data as! [TakingProductPopUpData]
                print(self.productPopUpData)
                    
                self.productImg.imageFromUrl(self.productPopUpData[0].imageKey, defaultImgPath: "imgLogo")
                self.productNameLbl.text = self.productPopUpData[0].productName
                self.productTakeUsage.text = self.productPopUpData[0].productDailyDose
                self.productAlarmLbl.text = self.productPopUpData[0].doseAlarm
                
                self.productRestCount.text = "\(String(describing: self.productPopUpData[1].remain!))회"
                
            case .requestErr(let msg):
                print(msg)
            case .pathErr:
                print("getTakingProductInfoAtPopUp pathErr")
            case .serverErr:
                print("getTakingProductInfoAtPopUp serverErr")
            case .networkFail:
                print("getTakingProductInfoAtPopUp networkFail")
            case .dbErr:
                print("getTakingProductInfoAtPopUp dbErr")
            }
        }
    }
    
    func setLayout(){
        if self.isDosed{
            self.dosedBtn.titleLabel?.textColor = UIColor.tealBlue
            self.dosedBtn.titleLabel?.text = "복용"
            
        }
        else{
            self.dosedBtn.titleLabel?.textColor = UIColor.init(red: 255 / 255, green: 87 / 255, blue: 47 / 255, alpha: 1)
            self.dosedBtn.titleLabel?.text = "복용취소"
        }
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
