//
//  ProductLowerPrice.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - ProductLowerPrice
struct ProductLowerPrice: Codable {
    let status: Int
    let message: String
    let data: [PriceInfo]
}

// MARK: - Datum
struct PriceInfo: Codable {
    let mallName: String
    let image: String
    let lprice: String
    let link: String
}
