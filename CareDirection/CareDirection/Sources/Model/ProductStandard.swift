//
//  ProductStandard.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation


// MARK: - ProductStandard
struct ProductStandard: Codable {
    let status: Int
    let message: String
    let data: [StandardData]
}

// MARK: - Datum
struct StandardData: Codable {
    let standard, standardValue, standardDescription: String

    enum CodingKeys: String, CodingKey {
        case standard
        case standardValue = "standard_value"
        case standardDescription = "standard_description"
    }
}
