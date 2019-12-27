//
//  TakingProductRegistCell.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductRegistCell: UICollectionViewCell {
    
    @IBOutlet weak var remainingLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var isShippingLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var isCheckedImage: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var pricePerOneLabel: UILabel!
    
    @IBOutlet weak var standardLabel: UILabel!
    
    
    @IBOutlet weak var shapeView: UIView!
    @IBOutlet weak var shapeRemainingView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shapeView.makeRounded(cornerRadius: 18)
        self.shapeView.dropShadow(color: UIColor.darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 2)
        
        self.shapeRemainingView.makeRounded(cornerRadius: 6)
        
        self.shapeRemainingView.backgroundColor = UIColor.seafoamBlue
        
    }
}
