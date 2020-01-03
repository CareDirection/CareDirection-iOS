//
//  TakingProductCVCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/30.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductCVCell: UICollectionViewCell {
    
    @IBOutlet var productImg: UIImageView!
    
    @IBOutlet var restProductCountLbl: UILabel!
    @IBOutlet var productCompayNameLbl: UILabel!
    
    @IBOutlet var productPurchaseCountryLbl: UILabel!
    
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var productPriceLbl: UILabel!
    
    @IBOutlet var productPricePerDayLbl: UILabel!
    
    @IBOutlet var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
