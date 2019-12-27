//
//  TakingProduct.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct TakingProduct {
    let remaining : String
    let companyName : String
    let isShipping : String
    let productName : String
    let price: String
    let pricePerOne : String
    let standard : String
    let productImage : UIImage?
    let isChecked : UIImage?
    
    init(remaining: String, companyName: String, isShipping: String, productName: String, price: String, pricePerOne: String, standard: String, productImage : String, isChecked: String) {
        self.remaining = remaining
        self.companyName = companyName
        self.isShipping = isShipping
        self.productName = productName
        self.price = price
        self.pricePerOne = pricePerOne
        self.standard = standard
        self.productImage = UIImage(named: productImage)
        self.isChecked = UIImage(named: isChecked)
    }
}
