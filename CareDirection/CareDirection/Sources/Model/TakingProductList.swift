//
//  TakingProductList.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/03.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - TakingProductInfoList
struct TakingProductInfoList: Codable {
    let status: Int
    let message: String
    let data: [TakingProductData]
}

// MARK: - Datum
struct TakingProductData: Codable {
    let productIdx: Int
    let productName, productCompanyName: String
    let productIsImport, productIsDosed: Bool
    let imageLocation: String
    let productPricePerUnit, productPrice, productQuantity: String
    let productRemain: Int

    enum CodingKeys: String, CodingKey {
        case productIdx = "product_idx"
        case productName = "product_name"
        case productCompanyName = "product_company_name"
        case productIsImport = "product_is_import"
        case productIsDosed = "product_is_dosed"
        case imageLocation = "image_location"
        case productPricePerUnit = "product_price_per_unit"
        case productPrice = "product_price"
        case productQuantity = "product_quantity"
        case productRemain = "product_remain"
    }
}

