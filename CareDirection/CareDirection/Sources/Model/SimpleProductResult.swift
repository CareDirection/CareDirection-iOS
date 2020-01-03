//
//  SimpleProductResult.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/03.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - SimpleProductResult
struct SimpleProductResult: Codable {
    let status: Int
    let message: String
    let data: [SimpleProductData]
}

// MARK: - Datum
struct SimpleProductData: Codable {
    let productName, productDailyDose: String
    let imageKey: String

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case productDailyDose = "product_daily_dose"
        case imageKey = "image_key"
    }
}
