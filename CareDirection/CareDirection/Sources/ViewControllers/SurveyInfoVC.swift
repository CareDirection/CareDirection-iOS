//
//  SurveyInfoVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/24.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyInfoVC: UIViewController {
    var userName: String? = "박진오"
    /*
     sex index
     0 : male
     1 : female
     */
    
    var userSexIndex: Int = 0
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var nameLbl2: UILabel!
    
    @IBOutlet var maleBtn: UIButton!
    @IBOutlet var femaleBtn: UIButton!
    
    @IBOutlet var userAgeView: UIView!
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userName{
            nameLbl.text = name + " 님"
            nameLbl2.text = name + " 님만의"
        }
        checkSexGroupBtn(selectSexIndex: userSexIndex)
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func checkSexGroupBtn(selectSexIndex: Int){
        switch selectSexIndex {
        case 0:
            maleBtn.isSelected = true
            femaleBtn.isSelected = false
            
            maleBtn.backgroundColor = UIColor(red: 182.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
            
            femaleBtn.backgroundColor = UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255.0 / 255.0, alpha: 0.4)
            
        case 1:
            maleBtn.isSelected = false
            femaleBtn.isSelected = true
            
            maleBtn.backgroundColor = UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255.0 / 255.0, alpha: 0.4)
            femaleBtn.backgroundColor = UIColor(red: 182.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        default:
            break
        }
    }
    
    func setLayout(){
        maleBtn.makeRounded(cornerRadius: 8)
        maleBtn.setBorder(borderColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4), borderWidth: 1)
        
        femaleBtn.makeRounded(cornerRadius: 8)
        femaleBtn.setBorder(borderColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4), borderWidth: 1)
        
        userAgeView.setBorder(borderColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4), borderWidth: 1)
        
        nextBtn.makeRounded(cornerRadius: 25)
        
    }
    
    
    @IBAction func maleBtnSelected(_ sender: Any) {
        userSexIndex = 0
        checkSexGroupBtn(selectSexIndex: userSexIndex)
    }
    
    @IBAction func femaleBtnSelected(_ sender: Any) {
        userSexIndex = 1
        checkSexGroupBtn(selectSexIndex: userSexIndex)
    }
}
