//
//  SymptomVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SymptomVC: UIViewController {
    
    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var goToProductButton: UIButton!
    
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    @IBOutlet weak var symptomTableView: UITableView!
    
    
    // 특정 성분 정보 타이틀 띄우는 라벨
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var tabIndex : Int = 0
    
    //var categoryList : [Efficacy] = []
    var symptomList : [EfficacyList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttom customize
        goToProductButton.makeRounded(cornerRadius: 17)
        goToProductButton.backgroundColor = UIColor.seafoamBlue
        
        goToProductButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
        
        // navigation bar drop shadow
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
        // 셀 사이즈 동적으로 조절해주기
        symptomTableView.rowHeight = UITableView.automaticDimension
        //symptomTableView.estimatedRowHeight = 600
        
        
        setSymptomData()
        
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func goToProduct(_ sender: Any) {
        let product = UIStoryboard.init(name: "Product", bundle: nil)
        
        guard let dvc = product.instantiateViewController(withIdentifier: "Product") as? ProductVC else {
            return
        }
        present(dvc, animated: true)
    }
    
}



extension SymptomVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symptomList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SymptomCategoryCell
        
        cell.categoryName.text = symptomList[indexPath.row].nutrient_name
        
        if indexPath.row == tabIndex {
            cell.categoryName.textColor = .tealBlue
            cell.categoryLine.isHidden = false
        } else {
            cell.categoryName.textColor = .lightGray
            cell.categoryLine.isHidden = true
        }
        
        return cell
    }
}

extension SymptomVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //self.tabIndex = indexPath.row
        setSymptomData()
        
        print("clicked")
    }
}

extension SymptomVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            
            let imageCell = symptomTableView.dequeueReusableCell(withIdentifier: "imageCell") as! SymptomImageCell
            
            imageCell.symptomImage.imageFromUrl(symptomList[indexPath.row].image_location, defaultImgPath: "imgLogo")
            
            return imageCell
            
        } else {
            
            let detailCell = symptomTableView.dequeueReusableCell(withIdentifier: "explainCell") as! SymptomDetailCell
            
            detailCell.symptomDetail.text = symptomList[indexPath.row].nutrient_efficacy_comment
            
            return detailCell
        }
    }
}

extension SymptomVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SymptomVC {
    func setSymptomData() {
        EfficacyService.shared.efficacyTabList(nutrientIdx: tabIndex) {
            [weak self]
            data in
            
            guard let `self` = self else { return }
                
                switch data {
                    
                // 매개변수에 어떤 값을 가져올 것인지
                case .success(let res):
                    
                    self.symptomList = res as! [EfficacyList]
                    self.tabBarCollectionView.reloadData()
                    self.symptomTableView.reloadData()
                    self.symptomTableView.dataSource = self
                    self.tabBarCollectionView.dataSource = self
                    
                    print("Efficacy Success")
                    
                case .requestErr(let message):
                    print("request Err")
                case .pathErr:
                    print(".pathErr")
                case .serverErr:
                    print(".serverErr")
                    
                case .networkFail:
                    print("network Err")
                case .dbErr:
                    print("db err")
                }
        }
    }
}

