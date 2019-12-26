//
//  Product.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Product {
    let productImage : UIImage?
    let productName : String
    let checkImage : UIImage?
    
    init(productImg: String, name: String, checkImg: String) {
        self.productImage = UIImage(named: productImg)
        self.productName = name
        self.checkImage = UIImage(named: checkImg)
    }
}
