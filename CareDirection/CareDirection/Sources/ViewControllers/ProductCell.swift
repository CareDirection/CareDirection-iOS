//
//  ProductCell.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productCheckImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
