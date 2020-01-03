//
//  ProductEfficacy.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - ProductEfficacy
struct ProductEfficacy: Codable {
    let status: Int
    let message: String
    let data: [EfficacyName]
}

// MARK: - Efficacy
struct EfficacyName: Codable {
    let efficacyName: String

    enum CodingKeys: String, CodingKey {
        case efficacyName = "efficacy_name"
    }
}
