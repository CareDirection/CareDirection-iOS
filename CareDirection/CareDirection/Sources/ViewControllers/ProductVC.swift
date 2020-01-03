//
//  ProductVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/29.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet var searchFiterTxtView: UITextField!
    @IBOutlet var searchTxtView: UITextField!
    @IBOutlet var searchFilterView: UIView!
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var defaultTypeView: UIView!

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var moreProductViewBtn: UIButton!
    
    @IBOutlet var topTabCV: UICollectionView!
    
    @IBOutlet var resultCountView: UIView!
    @IBOutlet var resultCountViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var resultViewCountLbl: UILabel!
    
    @IBOutlet var topProductTV: UITableView!
    @IBOutlet var topProductTVTopConstraint: NSLayoutConstraint!
    
    var selectedTapIndex: Int = 0
    var viewType: ViewType = .defaultView
    
    var resultCountViewHeight: CGFloat?
    let pickerList: [String] = ["제품", "성분"]
    var selectedCategory: String = "제품"
    var tabList: [TapData] = []
    var productList: [SearchList] = []
    var resultCountViewDefaultConstraint: CGFloat?
    
    
    // MARK - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setInitVar()
        initGestureRecognizer()
        setDynamicLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setLayout(){
        self.searchFilterView.makeRounded(cornerRadius: 3)
        self.searchFilterView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.searchView.makeRounded(cornerRadius: 3)
        self.searchView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.moreProductViewBtn.makeRounded(cornerRadius: 25)
        
        
    }
    func setInitVar(){
        topTabCV.delegate = self
        topTabCV.dataSource = self
        
        topProductTV.delegate = self
        topProductTV.dataSource = self
        
        createPicker()
        createToolBar()
        
        self.resultCountViewDefaultConstraint = self.resultCountViewTopConstraint.constant
        self.resultCountView.isHidden = true
        
        resultCountViewHeight = resultCountView.layer.frame.height
    }
    
    func setDynamicLayout(){
        switch viewType {
        case .defaultView:
            resultCountView.isHidden = true
            resultCountViewTopConstraint.constant = resultCountViewDefaultConstraint!
            moreProductViewBtn.isHidden = false
            self.topProductTVTopConstraint.constant = -(resultCountViewHeight!)
            backBtn.isHidden = true
            
            ProductTapService.shared.getTopTapList(){ data in
                switch data{
                case .success(let data):
                    self.tabList = data as! [TapData]
                    self.topTabCV.reloadData()
                    //self.tabList[self.selectedTapIndex].tabName
                    ProductTapService.shared.getProductTop2List(component: self.tabList[self.selectedTapIndex].tabName) { data in
                        switch data {
                        case .success(let data):
                            self.productList = data as! [SearchList]
                            self.topProductTV.reloadData()
                            print(self.productList)

                        case .pathErr:
                            print("pathErr")
                        case .serverErr:
                            print("server err")
                        default:
                            break
                        }
                    }
                case .pathErr:
                    print("path err")
                case .serverErr:
                    print("server err")
                default:
                    break
                }
            }
            
        case .searchView:
            resultCountView.isHidden = false
            resultCountViewTopConstraint.constant = 0
            moreProductViewBtn.isHidden = true
            self.topProductTVTopConstraint.constant = 0
            backBtn.isHidden = false
            
            ProductTapService.shared.searchProduct(keyword: searchTxtView.text ?? " ") { data in
                switch data {
                case .success(let data):
                    self.productList = data as! [SearchList]
                    self.resultViewCountLbl.text = "\(self.productList.count)"
                    self.topProductTV.reloadData()
                    print(self.productList)

                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("server err")
                default:
                    break
                }
            }
        }
        
        resultViewCountLbl.text = "\(productList.count)"
        
        topTabCV.reloadData()
        topProductTV.reloadData()
    }
    func createPicker(){
           let categoryPicker = UIPickerView()
           categoryPicker.delegate = self
           categoryPicker.dataSource = self
           
           searchFiterTxtView.inputView = categoryPicker
       }
       func createToolBar(){
           let toolBar = UIToolbar()
           toolBar.sizeToFit()
           
           let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SurveyInfoVC.dismissKeyboard))
           let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
           toolBar.setItems([flexibleSpace,doneBtn], animated: false)
           
           toolBar.isUserInteractionEnabled = true
           
           searchFiterTxtView.inputAccessoryView = toolBar
       }
       
       @objc func dismissKeyboard(){
           view.endEditing(true)
       }
    
    @IBAction func selectedSearchBtn(_ sender: Any) {
        self.viewType = .searchView
        guard let searchText = self.searchTxtView.text else{ return }
        
        let nonSpacingTxt = searchText.trimmingCharacters(in: .whitespaces)
        self.searchTxtView.text = nonSpacingTxt
        print(nonSpacingTxt)
        productList = []
        if searchFiterTxtView.text == "제품"{
            setDynamicLayout()
        }
        else {
            ProductTapService.shared.searchComponent(keyword: nonSpacingTxt){ data in
                switch data {
                case .success(_):
                    let dvc = self.storyboard?.instantiateViewController(identifier: "ComponentProductVC") as! ComponentProductVC
                    dvc.modalPresentationStyle = .fullScreen
                    dvc.componentName = nonSpacingTxt
                    self.present(dvc, animated: true)
                case .requestErr(_):
                    self.searchTxtView.text = ""
                    self.setDynamicLayout()
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                case .dbErr:
                    print("dbErr")
                }
                
            }
        }
        
        
        
    }
    
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.viewType = .defaultView
        setDynamicLayout()
    }
    
    @IBAction func selectedMoreProductViewBtn(_ sender: Any) {
        let dvc = self.storyboard?.instantiateViewController(identifier: "ComponentProductVC") as! ComponentProductVC
        dvc.modalPresentationStyle = .fullScreen
        dvc.componentName = self.tabList[self.selectedTapIndex].tabName
        self.present(dvc, animated: true)
    }
    
}

extension ProductVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
}
extension ProductVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = pickerList[row]
        searchFiterTxtView.text = selectedCategory
    }
}
extension ProductVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedTapIndex = indexPath.row
        setDynamicLayout()
    }
    
}
extension ProductVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopTabBarCVCell", for: indexPath) as! TopTabBarCVCell
        cell.tabNameLbl.text = tabList[indexPath.row].tabName
        
        if indexPath.row == selectedTapIndex{
            cell.tabHighlightLbl.isHidden = false
            cell.tabNameLbl.textColor = UIColor.tealBlue
        }else{
            cell.tabHighlightLbl.isHidden = true
            cell.tabNameLbl.textColor = UIColor.veryLightPink
        }
        
        return cell
    }
}

extension ProductVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.layer.frame.width / 3 - 10
        let cellHeight = collectionView.layer.frame.height - 10
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


extension ProductVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "ProductDetail", bundle: nil)
        let dvc = storyBoard.instantiateViewController(identifier: "ProductDetail") as! ProductDetailVC
        dvc.productIdx = self.productList[indexPath.row].productIdx

        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
}
extension ProductVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewType {
        case .defaultView:
            return productList.count
        case .searchView:
            if productList.count == 0 {
                return 1
            }else{
                return productList.count
            }

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewType {
        case .defaultView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestProductTVCell") as! BestProductTVCell
            cell.nameLbl.text = productList[indexPath.row].productName
            cell.companyNameLbl.text = productList[indexPath.row].productCompanyName
            cell.priceLbl.text = "\(productList[indexPath.row].productQuantityPrice)"
            cell.img.imageFromUrl(productList[indexPath.row].imageKey, defaultImgPath: "logo")
            if productList[indexPath.row].productIsImport == 1 {
                cell.purchaseCountryLbl.isHidden = false
            }
            else {
                cell.purchaseCountryLbl.isHidden = true
            }
            
            if indexPath.row == 0 {
                cell.rankImg.image = UIImage.init(named: "imgNumber1")
            }else{
                cell.rankImg.image = UIImage.init(named: "imgNumber2")
            }
            return cell
        case .searchView:
            if productList.count != 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "BestProductTVCell") as! BestProductTVCell
                cell.nameLbl.text = productList[indexPath.row].productName
                cell.rankImg.isHidden = true
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "NoResultCell")

                return cell!
            }
            
        }

     }
}

extension ProductVC : UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        // for table view & collection view tab recognize while hiding keybord by tapping other view
        textFieldTap.cancelsTouchesInView = false
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.searchTxtView.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: searchTxtView))! {

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


enum ViewType {
    case defaultView
    case searchView
}
