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
    let efficacyIdx: Int
    let efficacyName: String
}

struct EfficacyList : Codable {
    let nutrientIdx: Int
    let nutrientName, nutrientEfficacyComment, imageLocation: String
}
