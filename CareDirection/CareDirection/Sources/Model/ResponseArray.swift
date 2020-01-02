//
//  ResponseArray.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
// MARK: - ResponseArray
// data가 배열인 경우
struct ResponseArray<T: Codable>: Codable  {
    let status: Int
    //let success: Bool
    let message: String
    let data: [T]?
}
