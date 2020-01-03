//
//  TakingProductSearchList.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/03.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - TakingProductSearchList
struct TakingProductSearchList: Codable {
    let status: Int
    let message: String
    let data: [TakingProductSearch]
}

// MARK: - Datum
struct TakingProductSearch: Codable {
    let productIdx: Int
    let productName, productCompanyName: String
    let productIsImport: Bool
    let imageLocation: String
    let productPricePerUnit, productPrice: String
    let productIsAlreadyManaged: Bool
    let productQuantity: String

    enum CodingKeys: String, CodingKey {
        case productIdx = "product_idx"
        case productName = "product_name"
        case productCompanyName = "product_company_name"
        case productIsImport = "product_is_import"
        case imageLocation = "image_location"
        case productPricePerUnit = "product_price_per_unit"
        case productPrice = "product_price"
        case productIsAlreadyManaged = "product_is_already_managed"
        case productQuantity = "product_quantity"
    }
}
