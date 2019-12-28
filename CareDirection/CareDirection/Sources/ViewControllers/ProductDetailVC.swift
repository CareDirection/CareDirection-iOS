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
    
    @IBOutlet var productNoticeTB: UITableView!
    
    @IBOutlet var naverLowestPriceInfoCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}



