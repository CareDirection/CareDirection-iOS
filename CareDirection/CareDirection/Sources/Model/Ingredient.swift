//
//  Ingredient.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Ingredient {
    let ingredientImage : UIImage?
    let ingredientDetailImage : UIImage?
    let ingredientName : String
    let ingredientDetail : String
    
    init(image : String, detailImage : String, name : String, detail : String) {
        self.ingredientImage = UIImage(named: image)
        self.ingredientDetailImage = UIImage(named: detailImage)
        self.ingredientName = name
        self.ingredientDetail = detail
    }
}
