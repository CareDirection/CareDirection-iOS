//
//  TakingProductInfoVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/30.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductInfoVC: UIViewController {
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var takingUsageLbl: UILabel!
    
    @IBOutlet var predictedTakingQuantityPerDayView: UIView!
    @IBOutlet var predictedTakingQuantityPerDayTxtField: UITextField!
    
    @IBOutlet var takingStartDayView: UIView!
    @IBOutlet var takingStartDayTxtField: UITextField!
    
    @IBOutlet var takingAlarmSettingView: UIView!
    @IBOutlet var takingAlarmSettingTxtField: UITextField!
    
    @IBOutlet var registBtn: UIButton!
    var numOfList:[Int] = []
    var selectedNum:Int = 0
    var productIdx: Int?
    
    let predictedTakingQuantityPicker = UIPickerView()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let today:Date = Date()
    var dateInfo: String?
    var alarmInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitLayout()
        setInitVar()
        // Do any additional setup after loading the view.
    }
    func setInitVar(){
        for i in 1...100{
            numOfList.append(i)
        }
        if let id = productIdx{
            print("idididididid")
            print(id)
            TakingProductService.shared.getProductSimpleData(idx: id) { data in
                switch data{
                case .success(let data):
                    let result = data as! [SimpleProductData]
                    print(result)
                    self.img.imageFromUrl(result[0].imageKey, defaultImgPath: "ImgLogo")
                    self.nameLbl.text = result[0].productName
                    self.takingUsageLbl.text = result[0].productDailyDose
                
                case .requestErr(let msg):
                    print(msg)
                case .pathErr:
                    print("getProductSimpleData path err")
                case .serverErr:
                    print("getProductSimpleData serverErr err")
                case .networkFail:
                    print("getProductSimpleData networkFail err")
                case .dbErr:
                    print("getProductSimpleData dbErr err")
                }
            }
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy년 MM월 dd일"
        takingStartDayTxtField.text = dateformatter.string(from: today)
        
        dateformatter.dateFormat = "yyyy-MM-dd"
        dateInfo = dateformatter.string(from: today)
        
        dateformatter.dateFormat = "HH시 mm분"
        takingAlarmSettingTxtField.text = dateformatter.string(from: today)
        
        dateformatter.dateFormat = "0000-00-00 HH:mm:ss"
        alarmInfo = dateformatter.string(from: today)
    }
    func setInitLayout(){
        self.predictedTakingQuantityPerDayView.makeRounded(cornerRadius: 8)
        self.takingStartDayView.makeRounded(cornerRadius: 8)
        self.takingAlarmSettingView.makeRounded(cornerRadius: 8)
        
        self.registBtn.makeRounded(cornerRadius: 25)
        createPicker()
        createToolBar()
    }
    func createPicker(){
        
        predictedTakingQuantityPicker.delegate = self
        predictedTakingQuantityPicker.dataSource = self
        
        predictedTakingQuantityPerDayTxtField.inputView = predictedTakingQuantityPicker
        
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(changedDate), for: .valueChanged)
        takingStartDayTxtField.inputView = datePicker
        
        
        timePicker.datePickerMode = .time
        takingAlarmSettingTxtField.inputView = timePicker
        timePicker.addTarget(self, action: #selector(changedTime), for: .valueChanged)
        
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SurveyInfoVC.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace,doneBtn], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        predictedTakingQuantityPerDayTxtField.inputAccessoryView = toolBar
        takingStartDayTxtField.inputAccessoryView = toolBar
        takingAlarmSettingTxtField.inputAccessoryView = toolBar
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func changedDate(){
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy년 MM월 dd일"
        let date = dateformatter.string(from: self.datePicker.date)
        
        takingStartDayTxtField.text = date
        dateformatter.dateFormat = "yyyy-MM-dd"
        self.dateInfo = dateformatter.string(from: self.datePicker.date)
    }
    
    @objc func changedTime(){
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH시 mm분"
        let date = dateformatter.string(from: self.timePicker.date)

        takingAlarmSettingTxtField.text = date
        dateformatter.dateFormat = "0000-00-00 HH:mm:ss"
        self.alarmInfo = dateformatter.string(from: self.timePicker.date)

    }
    
    @IBAction func selectedRegistBtn(_ sender: Any) {

        TakingProductService.shared.registTakingProduct(idx: productIdx!, quantity: selectedNum, startDate: dateInfo!, alarm: alarmInfo!){ data in
            switch data{
            case .success(let msg):
                print(msg)
            case .requestErr(let msg):
                print(msg)
            case .pathErr:
                print("registTakingProduct path err")
            case .serverErr:
                print("registTakingProduct server err")
            case .networkFail:
                print("registTakingProduct network err")
            case .dbErr:
                print("registTakingProduct db err")
            }
            
        }
        
    }
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension TakingProductInfoVC: UITextFieldDelegate{
    
}

extension TakingProductInfoVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.numOfList.count
    }
}

extension TakingProductInfoVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numOfList[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNum = numOfList[row]
        predictedTakingQuantityPerDayTxtField.text = "\(numOfList[row])정"
    }
}
