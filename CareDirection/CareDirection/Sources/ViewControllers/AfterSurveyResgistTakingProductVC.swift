//
//  AfterSurveyResgistTakingProductVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/30.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class AfterSurveyResgistTakingProductVC: UIViewController {
    
    @IBOutlet var completeBtn: UIButton!
    
    @IBOutlet var takingProductCV: UICollectionView!

    @IBOutlet var cvTopConstraint: NSLayoutConstraint!
    var defaultheight: CGFloat = 0
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitLayout()
        setInitVar()
        
    }
    
    //
    func setInitLayout(){
        completeBtn.makeRounded(cornerRadius: 25)
        defaultheight = cvTopConstraint.constant
        cvTopConstraint.constant = CGFloat((data.count + 1) * 140)
    }
    
    func setInitVar(){
        takingProductCV.delegate = self
        takingProductCV.dataSource = self
        
    }
    
    @IBAction func selectedCompeteBtn(_ sender: Any) {
        
    }
    @IBAction func dissmiss(_ sender: Any) {
        
    }
    
}


extension AfterSurveyResgistTakingProductVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == data.count {
            print("registcell")
        }
        else {
            print("takingcell")
        }
    }
    
}

extension AfterSurveyResgistTakingProductVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row ==  data.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductResgistCell", for: indexPath)
            cell.backgroundView?.makeRounded(cornerRadius: 18)
            cell.backgroundView?.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 18)
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TakingProductCVCell", for: indexPath)  as! TakingProductCVCell

            cell.borderView.makeRounded(cornerRadius: 18)
            cell.borderView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
            
            return cell
        }
        
        
    }
}
extension AfterSurveyResgistTakingProductVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                // default width: 100, height: 42
        let cellHeight = (defaultheight - 40) / 3
        let cellWidth = (collectionView.bounds.size.width)
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
    }
    
}


