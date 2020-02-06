//
//  ProductDetailVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/28.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    // MARK:- IBOutlet Var
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
    
    @IBOutlet var functionHeightConstraints: NSLayoutConstraint!
    @IBOutlet var productFeatureLbl: UILabel!
    
    @IBOutlet var productHowToTakeLbl: UILabel!
    
    @IBOutlet var productComponentInfoTV: UITableView!
    
    @IBOutlet var productComponentHeightConstraint: NSLayoutConstraint!
    @IBOutlet var productAdditiveLbl: UILabel!
    

    @IBOutlet var productNoticeTV: UITableView!
    @IBOutlet var productNoticeHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var naverLowestPriceInfoCV: UICollectionView!
    
    @IBOutlet var goToLowerPriceInfoBtn: UIButton!
    
    @IBOutlet var productFirstCategoryView: UIView!
    @IBOutlet var productSecondCategory: UIView!
    @IBOutlet var productThirdCategory: UIView!
    
    
    @IBOutlet var productFunctionView: UIView!
    @IBOutlet var productComponentGraphView: UIView!
    
    // MARK:- Member Var
    var productFunctionCVExtensionData: [EfficacyName]?
    var productComponentInfoTVExtensionComponentName: [String]?
    var productComponentInfoTVExtensionComponentInfo: [String]?
    var productNoticeTVExtensionData: [String]?
    var naverLowestPriceInfoCVExtensionData: [PriceInfo]?
    
    var productIdx: Int?
    var entryPoint: Int! = 0
    var detailData: [Detail] = []
    var priceInfoList: [CountPrice] = []
    var productInfo: CommonData!
    
    let pickerList: [Int] = [30, 90, 180]
    var selectedPillCount:Int = 90
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChartView.playAnimations()
        initVar()
        setLayout()
        
        
        //var pillCountStandardList: [String] = [""]
        // Do any additional setup after loading the view.
    }
    func initVar(){
        
        //
        ProductTapService.shared.getProductDetail(idx: productIdx!) { data in
            switch data {
            case .success(let data):
                let result = data as! [Detail]
                self.detailData = result

                self.priceInfoList.append(self.detailData[0].countPrice!)
                self.productInfo = self.detailData[self.detailData.endIndex - 1].commonData!
                print(self.productInfo)
                
                self.productComponentInfoTVExtensionComponentName = self.productInfo.productDetailName.split(separator: "\n").map(String.init)
                self.productComponentInfoTVExtensionComponentInfo = self.productInfo.productDetailValue.split(separator: "\n").map(String.init)
                self.productComponentHeightConstraint.constant = CGFloat((self.productComponentInfoTVExtensionComponentInfo?.count ?? 1) * 30)
                self.productComponentInfoTV.dataSource = self
                
                self.productNoticeTVExtensionData = self.productInfo.productCautions.split(separator: "\n").map(String.init)
                self.productNoticeHeightConstraint.constant = CGFloat(25 * (self.productNoticeTVExtensionData?.count ?? 1))

                self.productNoticeTV.dataSource = self
                
                self.setLayout()
                self.setCommunicationData()
                self.productComponentInfoTV.reloadData()
                self.productNoticeTV.reloadData()
                
            case .requestErr(let msg):
                print(msg)
            case .serverErr:
                print("getProductDetailserver err")

            case .pathErr:
                print("getProductDetailpath err")

            case .networkFail:
                print("getProductDetailnetworkfail err")
            case .dbErr:
                print("getProductDetaildberr err")
            }
        }
        
        ProductTapService.shared.productDetailEfficacy(idx: productIdx!){ data in
            switch data {
            case .success(let data):
                let result = data as! [EfficacyName]
                self.productFunctionCVExtensionData = result
                self.productFunctionCV.delegate = self
                self.productFunctionCV.dataSource = self
                self.functionHeightConstraints.constant = 0
                
            case .requestErr(let msg):
                print(msg)
            case .pathErr:
                print("productDetailEfficacypathErr")
            case .serverErr:
                print("productDetailEfficacyserverErr")
            case .networkFail:
                print("productDetailEfficacynetworkFail")
            case .dbErr:
                print("productDetailEfficacydbErr")
            }
            
        }
        
        ProductTapService.shared.lowerPriceData(idx: productIdx!, quantity: 30){ data in
            switch data {
                case .success(let data):
                    let result = data as! [PriceInfo]
                    self.naverLowestPriceInfoCVExtensionData = result
                    self.naverLowestPriceInfoCV.delegate = self
                    self.naverLowestPriceInfoCV.dataSource = self
                    self.naverLowestPriceInfoCV.reloadData()
                case .requestErr(let msg):
                    print(msg)
                case .pathErr:
                    print("lowerPriceDatapathErr")
                case .serverErr:
                    print("lowerPriceDataserverErr")
                case .networkFail:
                    print("lowerPriceDatanetworkFail")
                case .dbErr:
                    print("dbErr")
            }
        }
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
// MARK:- PickerDelegateExtension
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

// MARK:- CollectionView Extension
// MARK: CollectionViewDelegate Extension
extension ProductDetailVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case productFunctionCV:
            break
        case naverLowestPriceInfoCV:
            guard let url = URL(string: naverLowestPriceInfoCVExtensionData![indexPath.row].link), UIApplication.shared.canOpenURL(url) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        default:
            break

        }
    }
}
// MARK: CollectionViewDataSource Extension
extension ProductDetailVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productFunctionCV:
            return productFunctionCVExtensionData?.count ?? 0
        case naverLowestPriceInfoCV:
            return naverLowestPriceInfoCVExtensionData?.count ?? 0
        default:
            return 0

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case productFunctionCV:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductFunctionCVCell", for: indexPath) as! ProductFunctionCVCell
                cell.functionNameLbl.text = productFunctionCVExtensionData![indexPath.row].efficacyName
                
                return cell
            case naverLowestPriceInfoCV:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NaverLowestPriceInfoCVCell", for: indexPath) as! NaverLowestPriceInfoCVCell
                cell.productImg.imageFromUrl(naverLowestPriceInfoCVExtensionData![indexPath.row].image, defaultImgPath: "imgLogo")
                cell.priceLbl.text = "\(naverLowestPriceInfoCVExtensionData![indexPath.row].lprice)"
                cell.purchasePlaceLbl.text = naverLowestPriceInfoCVExtensionData![indexPath.row].mallName
                
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}

// MARK: CollectionViewDelegateFlowLayout Extension
extension ProductDetailVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case productFunctionCV:
            let cellHeight = (collectionView.bounds.size.height)
            let cellWidth = (collectionView.bounds.size.width - 22) / 4
            
            return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
        case naverLowestPriceInfoCV:
            return CGSize(width: CGFloat(339), height: CGFloat(97))
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

// MARK:- TableView Extension
// MARK: TableViewDataSource Extension
extension ProductDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case productComponentInfoTV:
            return productComponentInfoTVExtensionComponentName?.count ?? 0
        case productNoticeTV:
            return productNoticeTVExtensionData?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
            case productComponentInfoTV:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductComponentInfoTVCell") as! ProductComponentInfoTVCell
                if productComponentInfoTVExtensionComponentName![indexPath.row][productComponentInfoTVExtensionComponentName![indexPath.row].startIndex] == "-"{
                    cell.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                }
                cell.categoryLbl.text = productComponentInfoTVExtensionComponentName![indexPath.row]
                cell.infoLbl.text = productComponentInfoTVExtensionComponentInfo![indexPath.row]
                
                
                return cell
            case productNoticeTV:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductNoticeTVCell") as! ProductNoticeTVCell
            cell.noticeLbl.text = productNoticeTVExtensionData![indexPath.row]
            
            return cell
            default:
                return UITableViewCell()
        }
    }
}

