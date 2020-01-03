//
//  FunctionalIngredient.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct FunctionalIngredient {
    var ingredientImage : UIImage?
    var ingredientName : String

    init(image : String, name: String) {
        self.ingredientImage = UIImage(named: image)
        self.ingredientName = name
    }
}
//MARK: - 기능성분 가져오기
struct FunctionalNutrient : Codable {
    let nutrient: String
    let efficacy: [FunctionalEfficacy]?
}

struct FunctionalEfficacy : Codable {
    let efficacy_name : String
}
