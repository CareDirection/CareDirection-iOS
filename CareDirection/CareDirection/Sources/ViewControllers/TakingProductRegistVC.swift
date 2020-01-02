//
//  TakingProductRegistVC.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductRegistVC: UIViewController {
    
    
    @IBOutlet weak var datePickButton: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var takingProductCollectionView: UICollectionView!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBOutlet weak var datePickerTotalView: UIView!
    
    @IBOutlet weak var navigationBar: UIView!
    
    var takingProductList: [TakingProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // date pick button customize
        datePickButton.makeRounded(cornerRadius: 8)

        datePickButton.dropShadow(color: UIColor.darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 4)
        
        setTakingProduct()
        
        datePickerView.addTarget(self, action: #selector(changed), for: .valueChanged)
        
        datePickerTotalView.isHidden = true
        
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)

    }
    
    @objc func changed() {
        let dateformatter = DateFormatter()

        dateformatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let date = dateformatter.string(from: datePickerView.date)

        dateLabel.text = date
    }

    // back button action
    @IBAction func backButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // date pick button click action
    @IBAction func datePickButtonClick(_ sender: Any) {
        
        datePickerTotalView.isHidden = false
        datePickerView.isHidden = false
    }
    
    
}




extension TakingProductRegistVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return takingProductList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = takingProductCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! TakingProductRegistCell
        
        let addCell = takingProductCollectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! AddTakingProductRegistCell
        
        let product = takingProductList[indexPath.row]
        
        if indexPath.row == takingProductList.count - 1 {
            return addCell
        } else {
            
            cell.isCheckedImage.image = product.isChecked
            cell.isShippingLabel.text = product.isShipping
            cell.priceLabel.text = product.price
            cell.pricePerOneLabel.text = product.pricePerOne
            cell.companyLabel.text = product.companyName
            cell.productImage.image = product.productImage
            cell.productNameLabel.text = product.productName
            cell.remainingLabel.text = product.remaining
            
            return cell
        }
    }
    
    
}

extension TakingProductRegistVC {
    func setTakingProduct() {
        let product1 = TakingProduct(remaining: "10", companyName: "Vita Naturals Inc", isShipping: "해외배송", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        let product2 = TakingProduct(remaining: "10", companyName: "NATURAL LIFE NUTRI…", isShipping: "", productName: "뉴트리디데이 프리미엄 오메가 3 골드 1100", price: "16,920원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        
        let product3 = TakingProduct(remaining: "10", companyName: "NATURAL LIFE NUTRI…", isShipping: "", productName: "뉴트리디데이 프리미엄 오메가 3 골드 1100", price: "16,920원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        
        let product4 = TakingProduct(remaining: "10", companyName: "NATURAL LIFE NUTRI…", isShipping: "", productName: "뉴트리디데이 프리미엄 오메가 3 골드 1100", price: "16,920원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        
        let product5 = TakingProduct(remaining: "10", companyName: "NATURAL LIFE NUTRI…", isShipping: "", productName: "뉴트리디데이 프리미엄 오메가 3 골드 1100", price: "16,920원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        
        let product6 = TakingProduct(remaining: "10", companyName: "NATURAL LIFE NUTRI…", isShipping: "", productName: "뉴트리디데이 프리미엄 오메가 3 골드 1100", price: "16,920원", pricePerOne: "(1일 750원)", standard: "30정 기준", productImage: "", isChecked: "uncheckCircleIc")
        
        takingProductList = [product1, product2, product3, product4, product5, product6]
    }
}
