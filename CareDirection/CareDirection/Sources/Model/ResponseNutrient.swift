//
//  ResponseNutrient.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct ResponseNutrient: Codable {
    let status: Int
    let message: String
    let data: FunctionalNutrient!
}
