//
//  HomeVC.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var showDetailStandard: UIButton!
    
    @IBOutlet weak var showDetailFunction: UIButton!
    
    @IBOutlet weak var showSchedule: UIButton!
    
    
    var productList : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제품 리스트 더미 데이터 생성
        setProductData()
        
        // collection view delegate, dataSource 설정
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        // scroll view edgeinset 지정해주기
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        
        // button custom 하기
        showDetailStandard.makeRounded(cornerRadius: 13)
        
        showDetailFunction.makeRounded(cornerRadius: 13)
        
        showSchedule.makeRounded(cornerRadius: 13)
        showSchedule.setBorder(borderColor: UIColor.brownishGrey, borderWidth: 1)
        
        
    }
    
    // 필수 비타민 & 미네랄 상세보기 button action
    @IBAction func showDetailButtonClick(_ sender: Any) {
        
    }
    
    
    
    // 기능성 원료 상세보기 button action
    @IBAction func showFunctionButtonClick(_ sender: Any) {
        
    }
    
    // 복용관리 -> 스케쥴표 보기 button action
    @IBAction func showScheduleButtonClick(_ sender: Any) {
        
    }
    
}


// collection view datasource
extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        
        let product = productList[indexPath.row]
        
        cell.productName.text = product.productName
        cell.productImage.image = product.productImage
        cell.productCheckImage.image = product.checkImage
        
        return cell
    }
    
    
}

// collection view delegate
extension HomeVC : UICollectionViewDelegate {
    
}

// 제품리스트 더미 데이터 세팅
extension HomeVC {
    func setProductData() {
        let product1 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product2 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product3 = Product(productImg: "test1", name: "얼라이브", checkImg: "checkCircleIc")
        let product4 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product5 = Product(productImg: "test1", name: "얼라이브", checkImg: "checkCircleIc")
        
        productList = [product1, product2, product3, product4, product5]
    }
}
