//
//  TakingProductPopUpResult.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/04.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation


// MARK: - SimpleProductResult
struct TakingProductPopUpResult: Codable {
    let status: Int
    let message: String
    let data: [TakingProductPopUpData]
}

// MARK: - Datum
struct TakingProductPopUpData: Codable {
    let doseInitialCount: Int?
    let productName, productDailyDose, imageKey, doseAlarm: String?
    let remain: Int?

    enum CodingKeys: String, CodingKey {
        case doseInitialCount = "dose_initial_count"
        case productName = "product_name"
        case productDailyDose = "product_daily_dose"
        case imageKey = "image_key"
        case doseAlarm = "dose_alarm"
        case remain
    }
}
