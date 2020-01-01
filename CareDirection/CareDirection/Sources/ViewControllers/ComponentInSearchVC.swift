//
//  ComponentInSearchVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ComponentInSearchVC: UIViewController {

    @IBOutlet var searchCategoryView: UIView!
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var searchCategoryTxtField: UITextField!
    
    @IBOutlet var searchTxtField: UITextField!
    
    @IBOutlet var searchCountView: UIView!
    @IBOutlet var searchCountLbl: UILabel!
    
    @IBOutlet var searchResultTV: UITableView!
    
    let pickerList:[String] = ["제품", "성분"]
    var selectedSearchCategory: String  = "제품"
    
    var searchResultData: [String] = ["1", "2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPicker()
        createToolBar()
        
        setInitLayout()
        setInitVar()
        initGestureRecognizer()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }

    
    func setInitLayout(){
        searchCountView.isHidden = true
        searchResultTV.isHidden = true
        
        self.searchCategoryView.makeRounded(cornerRadius: 3)
        self.searchCategoryView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.searchView.makeRounded(cornerRadius: 3)
        self.searchView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        searchCountLbl.text = "\(searchResultData.count)"
    }
    func setInitVar(){
        searchResultTV.delegate = self
        searchResultTV.dataSource = self

    }
    
    func createPicker(){
        let categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        searchCategoryTxtField.inputView = categoryPicker
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SurveyInfoVC.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace,doneBtn], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        searchCategoryTxtField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectedSearchBtn(_ sender: Any) {
        searchCountView.isHidden = false
        searchResultTV.isHidden = false
    }
    

    
}

extension ComponentInSearchVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
}
extension ComponentInSearchVC: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSearchCategory = pickerList[row]
        searchCategoryTxtField.text = selectedSearchCategory
    }
}

extension ComponentInSearchVC: UITableViewDelegate{
    
}

extension ComponentInSearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchResultData.count == 0 {
            return 1
        }
        else {
            return searchResultData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchResultData.count == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoResultCell")
            
            return cell!
        }else{
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComponentInSearchResultTVCell") as! ComponentInSearchResultTVCell
            cell.name.text = searchResultData[indexPath.row]
            
            return cell
        }
    }
}


// MARK - 키보드 제어
extension ComponentInSearchVC : UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        textFieldTap.cancelsTouchesInView = false
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.searchTxtField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: searchTxtField))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
        
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
