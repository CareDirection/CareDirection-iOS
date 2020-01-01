//
//  FilterPopUpVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class FilterPopUpVC: UIViewController {
    @IBOutlet var firstCategoryView: UIView!
    
    @IBOutlet var secondCategoryFirstBtn: UIButton!
    
    @IBOutlet var secondCategorySecondBtn: UIButton!
    
    @IBOutlet var thirdCategoryFirstBtn: UIButton!
    
    @IBOutlet var thirdCategorySecondBtn: UIButton!
    
    @IBOutlet var popUpLayout: UIView!
    
    var selectedIndexOfFirstCategory: Int = 0
    var selectedIndexOfSecondCategory: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitLayout()
        setDynamicLayout()
        // Do any additional setup after loading the view.
    }
    
    func setInitLayout(){
        self.firstCategoryView.makeRounded(cornerRadius: 8)
        self.firstCategoryView.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        self.secondCategoryFirstBtn.makeRounded(cornerRadius: 8)
        self.secondCategoryFirstBtn.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        self.secondCategorySecondBtn.makeRounded(cornerRadius: 8)
        self.secondCategorySecondBtn.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        self.thirdCategoryFirstBtn.makeRounded(cornerRadius: 8)
        self.thirdCategoryFirstBtn.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        self.thirdCategorySecondBtn.makeRounded(cornerRadius: 8)
        self.thirdCategorySecondBtn.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 4)
        
        popUpLayout.makeRounded(cornerRadius: 21)
        
    }
    
    func setDynamicLayout(){
        switch selectedIndexOfFirstCategory {
        case 0:
            secondCategoryFirstBtn.isSelected = true
            secondCategoryFirstBtn.backgroundColor = UIColor.seafoamBlue
            secondCategorySecondBtn.isSelected = false
            secondCategorySecondBtn.backgroundColor = UIColor.white
        case 1:
            secondCategoryFirstBtn.isSelected = false
            secondCategoryFirstBtn.backgroundColor = UIColor.white
            secondCategorySecondBtn.isSelected = true
            secondCategorySecondBtn.backgroundColor = UIColor.seafoamBlue
        default:
            break
        }
        
        switch selectedIndexOfSecondCategory {
        case 0:
            thirdCategoryFirstBtn.isSelected = true
            thirdCategoryFirstBtn.backgroundColor = UIColor.seafoamBlue
            thirdCategorySecondBtn.isSelected = false
            thirdCategorySecondBtn.backgroundColor = UIColor.white
        case 1:
            thirdCategoryFirstBtn.isSelected = false
            thirdCategoryFirstBtn.backgroundColor = UIColor.white
            
            thirdCategorySecondBtn.isSelected = true
            thirdCategorySecondBtn.backgroundColor = UIColor.seafoamBlue
        default:
            break
        }
        
    }
    
    @IBAction func selectedFirstCategoryBtn(_ sender: UIButton) {
        self.selectedIndexOfFirstCategory = sender.tag
        setDynamicLayout()
    }
    
    @IBAction func selectedSecondCategoryBtn(_ sender: UIButton) {
        self.selectedIndexOfSecondCategory = sender.tag
        setDynamicLayout()
    }
    
    
    @IBAction func selectedCloseBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
