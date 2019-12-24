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
    var bornInYearList: [Int] = []
    var selectedYear: String?
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var nameLbl2: UILabel!
    
    @IBOutlet var maleBtn: UIButton!
    @IBOutlet var femaleBtn: UIButton!
    
    @IBOutlet var userAgeView: UIView!
    @IBOutlet var nextBtn: UIButton!
    
    @IBOutlet var userAgeTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1900...2020 {
            bornInYearList.append(i)
        }
        bornInYearList.reverse()
        
        createYearPicker()
        createToolBar()
        if let name = userName{
            nameLbl.text = name + " 님"
            nameLbl2.text = name + " 님만의"
        }
        
        checkSexGroupBtn(selectSexIndex: userSexIndex)
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func createYearPicker(){
        let yearPicker = UIPickerView()
        yearPicker.delegate = self
        yearPicker.dataSource = self
        
        userAgeTxtField.inputView = yearPicker
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SurveyInfoVC.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace,doneBtn], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        userAgeTxtField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
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
        userAgeView.makeRounded(cornerRadius: 8)
        
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

extension SurveyInfoVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        bornInYearList.count
    }
}

extension SurveyInfoVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(bornInYearList[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedYear = "\(bornInYearList[row])"
        userAgeTxtField.text = selectedYear
        
        if !(userAgeTxtField.text!.isEmpty){
            userAgeView.backgroundColor = UIColor(red: 182.0 / 255, green: 1, blue: 1, alpha: 1.0)

            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor(red: 19.0 / 255.0, green: 165.0 / 255.0, blue: 168.0 / 255.0, alpha: 1.0), for: .normal)
        }
        
    }
}

