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
    
    init(image : String) {
        self.ingredientImage = UIImage(named: image)
    }
}
