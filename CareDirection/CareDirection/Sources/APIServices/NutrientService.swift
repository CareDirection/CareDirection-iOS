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
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGlsZHVzZXJfaWR4Ijo0fQ.J6rwFP6n8HSmw8YWznkZri5eOpj-sNuzpFKuUY8zlBc"
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
                                do {
                                    
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseNutrient.self, from: value)
                                    
                                    completion(.success(result.data!))
                                    
                                } catch {
                                    completion(.pathErr)
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
