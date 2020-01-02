//
//  SymptomVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SymptomVC: UIViewController {

    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var goToProductButton: UIButton!
    
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    @IBOutlet weak var symptomTableView: UITableView!
    
    var categoryList : [Symptom] = []
    var symptomList : Symptom?
    
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
        symptomTableView.estimatedRowHeight = 600
        
        
    }

    @IBAction func backButtonClick(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    

}

extension SymptomVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return (categoryList?.categoryLabel.count)!
        
        print(categoryList.count)
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SymptomCategoryCell
    
        let category = categoryList[indexPath.row]
        
        cell.categoryName.text = category.categoryLabel

        if indexPath.row == 0 {
            cell.categoryName.textColor = .tealBlue
            cell.categoryLine.backgroundColor = .tealBlue
            
        }
        
        
        return cell
    }
    
    
}

extension SymptomVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = tabBarCollectionView.cellForItem(at: indexPath) as? SymptomCategoryCell else {return}
        
        
        cell.categoryName.textColor = UIColor.tealBlue
        cell.categoryLine.backgroundColor = UIColor.tealBlue
        
        print("clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = tabBarCollectionView.cellForItem(at: indexPath) as? SymptomCategoryCell else {return}
        
        cell.categoryName.textColor = .lightGray
        cell.categoryLine.backgroundColor = .clear
        
        
        print("deselected!")
    }
}

extension SymptomVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let imageCell = symptomTableView.dequeueReusableCell(withIdentifier: "imageCell") as! SymptomImageCell
            
            imageCell.symptomImage.image = categoryList[indexPath.row].symptomImage
            
            
            return imageCell
        } else {
            let detailCell = symptomTableView.dequeueReusableCell(withIdentifier: "explainCell") as! SymptomDetailCell
            
            detailCell.symptomDetail.text = categoryList[indexPath.row].symptomDetail
            
            return detailCell
        }
    }
    
    
}

extension SymptomVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
