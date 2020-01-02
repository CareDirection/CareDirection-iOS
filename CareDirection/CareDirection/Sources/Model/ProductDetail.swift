//
//  ProductDetail.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - ProductDetail
struct ProductDetail: Codable {
    let status: Int
    let message: String
    let data: [Detail]
}

// MARK: - Datum
struct Detail: Codable {
    let countPrice: CountPrice?
    let commonData: CommonData?

    enum CodingKeys: String, CodingKey {
        case countPrice = "count_price"
        case commonData = "common_data"
    }
}

// MARK: - CommonData
struct CommonData: Codable {
    let mainNutrientName: String
    let imageKey: String
    let productCompanyName, productName: String
    let productPackageType: Int
    let productStandard1, productStandard2, productStandard3, productStandard1Value: String
    let productStandard2Value, productStandard3Value, productFeaturesName, productDailyDose: String
    let productDetailName, productDetailValue, productAdditives, productCautions: String

    enum CodingKeys: String, CodingKey {
        case mainNutrientName = "main_nutrient_name"
        case imageKey = "image_key"
        case productCompanyName = "product_company_name"
        case productName = "product_name"
        case productPackageType = "product_package_type"
        case productStandard1 = "product_standard1"
        case productStandard2 = "product_standard2"
        case productStandard3 = "product_standard3"
        case productStandard1Value = "product_standard1_value"
        case productStandard2Value = "product_standard2_value"
        case productStandard3Value = "product_standard3_value"
        case productFeaturesName = "product_features_name"
        case productDailyDose = "product_daily_dose"
        case productDetailName = "product_detail_name"
        case productDetailValue = "product_detail_value"
        case productAdditives = "product_additives"
        case productCautions = "product_cautions"
    }
}

// MARK: - CountPrice
struct CountPrice: Codable {
    let productQuantityCount, productQuantityPrice: Int

    enum CodingKeys: String, CodingKey {
        case productQuantityCount = "product_quantity_count"
        case productQuantityPrice = "product_quantity_price"
    }
}
