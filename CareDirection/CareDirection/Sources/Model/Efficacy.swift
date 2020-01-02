//
//  Efficacy.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Efficacy : Codable {
    let efficacy_idx: Int
    let efficacy_name: String
}

struct EfficacyList : Codable {
    let nutrient_idx: Int
    let nutrient_name, nutrient_efficacy_comment, image_location: String
}
