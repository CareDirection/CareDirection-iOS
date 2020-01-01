//
//  ResponseString.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

// MARK: - ResponseString
// 성공했을 때 response body
struct ResponseString: Codable {
    let status: Int
    let message: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let token: String
}
