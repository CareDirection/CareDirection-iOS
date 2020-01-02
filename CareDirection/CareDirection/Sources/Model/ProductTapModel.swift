//
//  ProductTapModel.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation

struct ProductTap: Codable {
    let status: Int
    let message: String
    let data: [TapData]
}

// MARK: - TapData
struct TapData: Codable {
    let tabName: String

    enum CodingKeys: String, CodingKey {
        case tabName = "tab_name"
    }
}
