//
//  TakingProudctService.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire


struct TakingProductService {
    static let shared = TakingProductService()
    
    func getCurrentTakingList(date: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        //let token = UserDefaults.standard
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MjQsImlhdCI6MTU3Nzg3NzY1NiwiZXhwIjo4Nzk3Nzg3NzY1NiwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.WysKIH3-qDf3GTR-RKKl23hp_9byodzDm7TdISMTkmk"
        ]

        let body : Parameters = [
            "date" : date
        ]
        
        Alamofire.request(APIConstants.ProductDoseURL, method: .get, parameters: body, encoding: JSONEncoding.default, headers: header)
    }
}
