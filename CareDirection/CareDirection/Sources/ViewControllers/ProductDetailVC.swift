//
//  ProductDetailVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/28.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    @IBOutlet var componentNameLbl: UILabel!
    
    @IBOutlet var productImg: UIImageView!
    @IBOutlet var productImgInView: UIView!
    
    @IBOutlet var productCompanyNameLbl: UILabel!
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var productStandardPillCountTxtField: UITextField!
    @IBOutlet var productStandardPillCountView: UIView!
    
    @IBOutlet var productPriceLbl: UILabel!
    
    @IBOutlet var productPricePerDayLbl: UILabel!
    

    @IBOutlet var productFirstCategoryInfoLbl: UILabel!
    @IBOutlet var productFirstCategoryLbl: UILabel!
    
    
    @IBOutlet var productSecondCategoryInfoLbl: UILabel!
    @IBOutlet var productSecondCategoryLbl: UILabel!
    
    @IBOutlet var productThirdCategoryInfoLbl: UILabel!
    @IBOutlet var productThirdCategoryLbl: UILabel!
    
    @IBOutlet var productFunctionCV: UICollectionView!
    
    @IBOutlet var productFeatureLbl: UILabel!
    
    @IBOutlet var productHowToTakeLbl: UILabel!
    
    @IBOutlet var productComponentInfoTV: UITableView!
    
    @IBOutlet var productAdditiveLbl: UILabel!
    

    @IBOutlet var productNoticeTV: UITableView!
    
    @IBOutlet var naverLowestPriceInfoCV: UICollectionView!
    
    @IBOutlet var goToLowerPriceInfoBtn: UIButton!
    
    @IBOutlet var productFirstCategoryView: UIView!
    @IBOutlet var productSecondCategory: UIView!
    @IBOutlet var productThirdCategory: UIView!
    
    
    @IBOutlet var productFunctionView: UIView!
    @IBOutlet var productComponentGraphView: UIView!
    
    var productFunctionCVExtension = ProductFunctionCVExtension()
    var productComponentInfoTVExtension = ProductComponentInfoTVExtension()
    var productNoticeTVExtension = ProductNoticeTVExtension()
    var naverLowestPriceInfoCVExtension = NaverLowestPriceInfoCVExtension()
    
    var productIdx: Int?
    var entryPoint: Int! = 0
    var detailData: [Detail] = []
    var priceInfoList: [CountPrice] = []
    var productInfo: CommonData!
    
    let pickerList: [Int] = [30, 90, 180]
    var selectedPillCount:Int = 90
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        initVar()
        
        //var pillCountStandardList: [String] = [""]
        // Do any additional setup after loading the view.
    }
    func initVar(){
        
        
        ProductTapService.shared.getProductDetail(idx: productIdx!) { data in
            switch data {
            case .success(let data):
                let result = data as! [Detail]
                self.detailData = result
                self.priceInfoList.append(self.detailData[0].countPrice!)
                self.priceInfoList.append(self.detailData[1].countPrice!)
                
                self.productInfo = self.detailData[2].commonData!
                
                self.productComponentInfoTVExtension.componentInfo = self.productInfo.productDetailName.split(separator: "\n").map(String.init)
                self.productComponentInfoTVExtension.componentName = self.productInfo.productDetailValue.split(separator: "\n").map(String.init)
                
                self.productNoticeTVExtension.data = self.productInfo.productCautions.split(separator: "\n").map(String.init)
                
                self.productComponentInfoTV.reloadData()
                self.productNoticeTV.reloadData()
                
            case .requestErr(let msg):
                print(msg)
            case .serverErr:
                print("server err")

            case .pathErr:
                break
            case .networkFail:
                break
            case .dbErr:
                break
            }
        }
        
        ProductTapService.shared.productDetailEfficacy(idx: productIdx!){ data in
            switch data {
            case .success(let data):
                let result = data as! [EfficacyName]
                self.productFunctionCVExtension.data = result
                self.productFunctionCV.reloadData()
                
            case .requestErr(let msg):
                print(msg)
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
        
        ProductTapService.shared.lowerPriceData(idx: productIdx!, quantity: 30){ data in
            switch data {
                case .success(let data):
                    let result = data as! [PriceInfo]
                    self.naverLowestPriceInfoCVExtension.data = result
                    self.naverLowestPriceInfoCV.reloadData()
                case .requestErr(let msg):
                    print(msg)
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

        self.productFunctionCV.delegate = productFunctionCVExtension
        self.productFunctionCV.dataSource = productFunctionCVExtension
        
        
        self.productComponentInfoTV.delegate = productComponentInfoTVExtension
        self.productComponentInfoTV.dataSource = productComponentInfoTVExtension
        
        self.productNoticeTV.delegate = productNoticeTVExtension
        self.productNoticeTV.dataSource = productNoticeTVExtension
        
        self.naverLowestPriceInfoCV.delegate = naverLowestPriceInfoCVExtension
        self.naverLowestPriceInfoCV.dataSource = naverLowestPriceInfoCVExtension
    }
    
    func setLayout(){

         self.productImgInView.layer.cornerRadius = 25
         self.productImgInView.clipsToBounds = true
         self.productImgInView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
         self.productImgInView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1),
                                  offSet: CGSize(width: 0, height: 1),
                                  opacity: 0.16,
                                  radius: 4)
        self.goToLowerPriceInfoBtn.makeRounded(cornerRadius: 17)
        self.goToLowerPriceInfoBtn.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
        
        self.productFirstCategoryView.makeRounded(cornerRadius: 12)
        self.productFirstCategoryView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        self.productSecondCategory.makeRounded(cornerRadius: 12)
        self.productSecondCategory.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        self.productThirdCategory.makeRounded(cornerRadius: 12)
        self.productThirdCategory.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        productStandardPillCountView.makeRounded(cornerRadius: 6)
        
        createPicker()
        createToolBar()
    }
    
    func setCommunicationData(){
        self.componentNameLbl.text = productInfo.mainNutrientName
        self.productImg.imageFromUrl(productInfo.imageKey, defaultImgPath: "imgLogo")
        self.productCompanyNameLbl.text = productInfo.productCompanyName
        self.productNameLbl.text = productInfo.productName
        self.productStandardPillCountTxtField.text = "\(self.priceInfoList[0].productQuantityCount)"
        self.productPriceLbl.text = "\(self.priceInfoList[0].productQuantityPrice)"
        self.productPricePerDayLbl.text = "\(self.priceInfoList[0].productQuantityPrice / 30)"
        
        self.productFirstCategoryLbl.text = self.productInfo.productStandard1
        self.productSecondCategoryLbl.text = self.productInfo.productStandard2
        self.productThirdCategoryLbl.text = self.productInfo.productStandard3
        
        self.productFirstCategoryInfoLbl.text = self.productInfo.productStandard1Value
        self.productSecondCategoryInfoLbl.text = self.productInfo.productStandard2Value
        self.productThirdCategoryInfoLbl.text = self.productInfo.productStandard3Value
        
        self.productFeatureLbl.text = self.productInfo.productFeaturesName
        self.productHowToTakeLbl.text = self.productInfo.productFeaturesName
        self.productAdditiveLbl.text = self.productInfo.productAdditives
        
        
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func createPicker(){
        let countPickerView = UIPickerView()
        countPickerView.delegate = self
        countPickerView.dataSource = self
        
        productStandardPillCountTxtField.inputView = countPickerView
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SurveyInfoVC.dismissKeyboard))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexibleSpace,doneBtn], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        productStandardPillCountTxtField.inputAccessoryView = toolBar
    }
    
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ProductDetailVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerList[row])정"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPillCount = pickerList[row]
        productStandardPillCountTxtField.text = "\(selectedPillCount)정"
    }
    
}
extension ProductDetailVC: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: - ProductFunctionCVExtension
class ProductFunctionCVExtension : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var data: [EfficacyName]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductFunctionCVCell", for: indexPath) as! ProductFunctionCVCell
        cell.functionNameLbl.text = data![indexPath.row].efficacyName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.bounds.size.height)
        let cellWidth = (collectionView.bounds.size.width - 22) / 4
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
    }
}


class ProductComponentInfoTVExtension : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var componentName: [String]?
    var componentInfo: [String]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentName!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductComponentInfoTVCell") as! ProductComponentInfoTVCell
        if componentName![indexPath.row][componentName![indexPath.row].startIndex] == "-"{
            cell.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        }
        cell.categoryLbl.text = componentName![indexPath.row]
        cell.infoLbl.text = componentInfo![indexPath.row]
        
        
        return cell
    }
    
}

class ProductNoticeTVExtension: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data: [String]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductNoticeTVCell") as! ProductNoticeTVCell
        cell.noticeLbl.text = data![indexPath.row]
        
        return cell
    }
}

class NaverLowestPriceInfoCVExtension : UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var data: [PriceInfo]?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let url = URL(string: data![indexPath.row].link), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NaverLowestPriceInfoCVCell", for: indexPath) as! NaverLowestPriceInfoCVCell
        cell.productImg.imageFromUrl(data![indexPath.row].image, defaultImgPath: "imgLogo")
        cell.purchasePlaceLbl.text = data![indexPath.row].lprice
        cell.purchasePlaceLbl.text = data![indexPath.row].mallName
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: CGFloat(339), height: CGFloat(97))
    }
}

struct NaverLowestPriceInfo {
    var place: String
    var price: String
    var pricePerDay: String
}
struct ProductComponentInfo {
    var category: String
    var info: String
}

