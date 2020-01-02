//
//  ProductSearchModel.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation


// MARK: - ProductSearch
struct ProductSearch: Codable {
    let status: Int
    let message: String
    let data: SearchResult
}

// MARK: - DataClass
struct SearchResult: Codable {
    let topData: TopData
    let searchList: [SearchList]
}

// MARK: - SearchList
struct SearchList: Codable {
    let productIdx: Int
    let imageKey: String
    let productName, productCompanyName: String
    let productIsImport, productQuantityPrice, productQuantityCount: Int

    enum CodingKeys: String, CodingKey {
        case productIdx = "product_idx"
        case imageKey = "image_key"
        case productName = "product_name"
        case productCompanyName = "product_company_name"
        case productIsImport = "product_is_import"
        case productQuantityPrice = "product_quantity_price"
        case productQuantityCount = "product_quantity_count"
    }
}

// MARK: - TopData
struct TopData: Codable {
    let productIdx: Int
    let productStandard1, productStandard2, productStandard3, productStandard1Value: String
    let productStandard2Value, productStandard3Value: String

    enum CodingKeys: String, CodingKey {
        case productIdx = "product_idx"
        case productStandard1 = "product_standard1"
        case productStandard2 = "product_standard2"
        case productStandard3 = "product_standard3"
        case productStandard1Value = "product_standard1_value"
        case productStandard2Value = "product_standard2_value"
        case productStandard3Value = "product_standard3_value"
    }
}
