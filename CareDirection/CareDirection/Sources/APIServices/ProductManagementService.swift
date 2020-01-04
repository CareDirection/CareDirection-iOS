//
//  ProductManagementService.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/04.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire


struct ProductManagementService {
    static let shared = ProductManagementService()
    
    func getTakingProductInfoAtPopUp(idx: Int, completion: @escaping(NetworkResult<Any>) -> Void){
        let URL = APIConstants.ProductBaseURL + "/\(idx)/dose"
        let token = UserDefaults.standard
        //let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6NjQsImlhdCI6MTU3ODAyODgxOCwiZXhwIjo4Nzk3ODAyODgxOCwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.eR-912HpB7B9JCaYwUlkaGBEphLywOoRCyT4ZZB1DMI"
        
        let header: HTTPHeaders = [
            //"token" : token
            "token" : "\(token.string(forKey: "token")!)"
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData(){ response in
            switch response.result {
                
            // 통신 성공
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(TakingProductPopUpResult.self, from: value)
                                
                                completion(.success(result.data))
                                
                            } catch {
                                print(error.localizedDescription)
                                print("nutrient pathERrr")
                                completion(.requestErr("No Data"))
                            }
                        case 401:
                            completion(.requestErr("유효하지 않은 토큰"))
                        case 500:
                            completion(.serverErr)
                            
                        default:
                            print(status)
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
    
    
    func takeProduct(idx: Int, completion: @escaping (NetworkResult<Any>) -> Void){
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6NjQsImlhdCI6MTU3ODAyODgxOCwiZXhwIjo4Nzk3ODAyODgxOCwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.eR-912HpB7B9JCaYwUlkaGBEphLywOoRCyT4ZZB1DMI"
        
        let header: HTTPHeaders = [
            "token" : token
        ]
        
        let URL = APIConstants.ProductBaseURL + "/\(idx)/dose/check"
        
        Alamofire.request(URL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData(){ response in
            switch response.result {
                           
                       // 통신 성공
                       case .success:
                           if let value = response.result.value {
                               if let status = response.response?.statusCode {
                                   switch status {
                                   case 201:
                                       do {
                                           let decoder = JSONDecoder()
                                           let result = try decoder.decode(ResponseString2.self, from: value)
                                           
                                           completion(.success(result.message))
                                           
                                       } catch {
                                           print(error.localizedDescription)
                                           print("nutrient pathERrr")
                                           completion(.requestErr("No Data"))
                                       }
                                   case 401:
                                       completion(.requestErr("유효하지 않은 토큰"))
                                   case 403:
                                    do {
                                        let decoder = JSONDecoder()
                                        let result = try decoder.decode(ResponseString2.self, from: value)
                                        
                                        completion(.requestErr(result.message))
                                        
                                    } catch {
                                        print(error.localizedDescription)
                                        print("nutrient pathERrr")
                                        completion(.requestErr("No Data"))
                                    }
                                       
                                   default:
                                       print(status)
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
