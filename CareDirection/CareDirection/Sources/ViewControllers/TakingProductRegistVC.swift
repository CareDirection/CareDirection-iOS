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
    
    var takingProductList: [TakingProductData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // date pick button customize
        datePickButton.makeRounded(cornerRadius: 8)

        datePickButton.dropShadow(color: UIColor.darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 4)
        

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
        
        
        
        
        if indexPath.row == takingProductList.count {
            
            
            let addCell = takingProductCollectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! AddTakingProductRegistCell
            
            
            
            return addCell
        } else {
            let cell = takingProductCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! TakingProductRegistCell
            
            let product = takingProductList[indexPath.row]
            cell.productImage.imageFromUrl(product.imageLocation, defaultImgPath: "imgLogo")
            cell.remainingLabel.text = "\(product.productRemain)남음"
            cell.companyLabel.text = product.productCompanyName
            cell.productNameLabel.text = product.productName
            cell.priceLabel.text = product.productPrice
            cell.pricePerOneLabel.text = product.productPricePerUnit
            
            if product.productIsImport{
                cell.isShippingLabel.isHidden = false
            }
            else {
                cell.isShippingLabel.isHidden = true
            }
            if product.productIsDosed{
                cell.isCheckedImage.image = UIImage.init(named: "checkCircleIc")
            }else{
                cell.isCheckedImage.image = UIImage.init(named: "uncheckCircleIc")
            }
            return cell
        }
    }
}

extension TakingProductRegistVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == takingProductList.count - 1 {
        
            print("clicked")
        let addStoryboard = UIStoryboard.init(name: "ProductSearch", bundle: nil)
        
        guard let dvc = addStoryboard.instantiateViewController(withIdentifier: "ProductSearch") as? ProductSearchVC else {
            return
        }
        
        present(dvc, animated: true)
        }
    }
}
