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
    
    var productFunctionCVExtension = ProductFunctionCVExtension()
    var productComponentInfoTVExtension = ProductComponentInfoTVExtension()
    var productNoticeTVExtension = ProductNoticeTVExtension()
    var naverLowestPriceInfoCVExtension = NaverLowestPriceInfoCVExtension()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        initVar()
        // Do any additional setup after loading the view.
    }
    func initVar(){
        self.productFunctionCVExtension.data = ["심장 혈액순환", "심장 혈액순환", "심장 혈액순환", "심장 혈액순환"]
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
        
    }
    
}

// MARK: - ProductFunctionCVExtension
class ProductFunctionCVExtension : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var data = ["a", "b", "c", "d"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductFunctionCVCell", for: indexPath) as! ProductFunctionCVCell

        cell.functionNameLbl.text = data[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.bounds.size.height)
        let cellWidth = (collectionView.bounds.size.width - 22) / 4
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
    }
}


class ProductComponentInfoTVExtension : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data:[ProductComponentInfo] = [
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
        ProductComponentInfo.init(category: "열량", info: "13kcal"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductComponentInfoTVCell") as! ProductComponentInfoTVCell
        
        cell.categoryLbl.text = data[indexPath.row].category
        cell.infoLbl.text = data[indexPath.row].info
        
        
        return cell
    }
    
}

class ProductNoticeTVExtension: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data: [String] = ["- 절대 권장량을 초과하여 섭취하지 마십시오.", "- 절대 권장량을 초과하여 섭취하지 마십시오."]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductNoticeTVCell") as! ProductNoticeTVCell
        cell.noticeLbl.text = data[indexPath.row]
        
        return cell
    }
}

class NaverLowestPriceInfoCVExtension : UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var data: [NaverLowestPriceInfo] = [
        NaverLowestPriceInfo.init(place: "쿠팡", price: "16,920", pricePerDay: "188"),
        NaverLowestPriceInfo.init(place: "쿠팡", price: "16,920", pricePerDay: "188"),
        NaverLowestPriceInfo.init(place: "쿠팡", price: "16,920", pricePerDay: "188"),
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NaverLowestPriceInfoCVCell", for: indexPath) as! NaverLowestPriceInfoCVCell
        
        cell.purchasePlaceLbl.text = data[indexPath.row].place
        cell.priceLbl.text = data[indexPath.row].price
        cell.pricePerDayLbl.text = data[indexPath.row].pricePerDay
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.bounds.size.height - 10) / 3
        let cellWidth = (collectionView.bounds.size.width)
        
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

