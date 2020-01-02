//
//  ChartService.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct ChartService {
    static let shared = ChartService()
    
    func showMainChart(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.GetGraphURL
        
        //let token = UserDefaults.standard
        print("here okay")
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGlsZHVzZXJfaWR4IjoxfQ.iOg6R_zQ37_uhyddBohJ5tEOZNu9kKjqddAQJHOJ6vI"
            //"token" : "\(token.string(forKey: "token")!)"
        ]
        print("before request")
        
        Alamofire.request(APIConstants.GetGraphURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                print("inside request")
                
                switch response.result {
                    
                // 통신 성공
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    
                                    // Show.swift codable
                                    let result = try decoder.decode(ResponseArray<MainChart>.self, from: value)
                                    print("Success")
                                    completion(.success(result.data!))
                                
                                } catch {
                                    print("pathErr")
                                    completion(.pathErr)
                                }
                            case 400:
                                completion(.pathErr)
                                print(".pathErr")
                            case 600:
                                completion(.serverErr)
                                print("serverErr")
                            default:
                                print("default")
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
    
    func showDetailChart(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.GetMyNutrientDetailURL
        
        //let token = UserDefaults.standard
       
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6OH0.1aTgLt9PjqIDpERitt0eOQMuoyQUypMBYw4JaGi6M6M"
            //"token" : "\(token.string(forKey: "token")!)"
        ]
        
        print("왜 안돼 ?")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
            print("chart detail")
                switch response.result {
                    
                // 통신 성공
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            print("chart detail")
                            switch status {
                                
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    
                                    let result = try decoder.decode(ResponseArray<ChartDetail>.self, from: value)
                                    
                                    print("Success")
                                    completion(.success(result.data!))
                                    
                                } catch {
                                    print("pathErr")
                                    completion(.pathErr)
                                }
                            case 400:
                                completion(.pathErr)
                                print(".pathErr")
                            case 600:
                                completion(.serverErr)
                                print("serverErr")
                            default:
                                print("default")
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
