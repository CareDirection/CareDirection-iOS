//
//  NutrientService.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct NutrientService {
    
    static let shared = NutrientService()
    
    func showNutrient(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.GetNutrientFunctionURL
        let token = UserDefaults.standard
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            //"token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6NjQsImlhdCI6MTU3ODAyODgxOCwiZXhwIjo4Nzk3ODAyODgxOCwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.eR-912HpB7B9JCaYwUlkaGBEphLywOoRCyT4ZZB1DMI"
            "token" : "\(token.string(forKey: "token")!)"
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                // 통신 성공
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                print("nutrient success!")
                                do {
                                    
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseNutrient.self, from: value)
                                    
                                    completion(.success(result.data))
                                    
                                } catch {
                                    print(error.localizedDescription)
                                    print("nutrient pathERrr")
                                    completion(.requestErr("No Data"))
                                }
                            case 400, 401:
                                completion(.pathErr)
                            case 403:
                                print("유효하지 않은 토큰")
                            case 600:
                                completion(.serverErr)
                                
                            default:
                                break
                            }
                        }
                    }
                    break
                // 통신 실패
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                }
        }
    }
}
