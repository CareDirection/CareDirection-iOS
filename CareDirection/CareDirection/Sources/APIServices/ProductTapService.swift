//
//  ProductTapService.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/02.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct ProductTapService {
    static let shared = ProductTapService()
    
    func getTopTapList(completion: @escaping (NetworkResult<Any>) -> Void){
        let header : HTTPHeaders = [
            
            "Content-Type" : "application/json",
            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MjQsImlhdCI6MTU3Nzg3NzY1NiwiZXhwIjo4Nzk3Nzg3NzY1NiwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.WysKIH3-qDf3GTR-RKKl23hp_9byodzDm7TdISMTkmk"
        ]
        
        Alamofire.request(APIConstants.ProductTapListURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData { response in
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                if let value = response.result.value {
                    
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                print(value)
                                let result = try decoder.decode(ProductTap.self, from: value)
                                
                                //print("success")
                                completion(.success(result.data))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                            }
                        case 403:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
                
            // 통신 실패 - 네트워크 연결
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            }
        }
        
    }
    
    func getProductTop2List(component: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        //let URL = APIConstants.SearchBaseURL + "?query=\(component)&filter=nutrient&limit=2"
        
         let parameters: Parameters = [
             "query": component,
             "filter" : "nutrient",
             "limit" : 2
         ]
        Alamofire.request(APIConstants.SearchBaseURL, method: .get, parameters: parameters ,encoding: URLEncoding.queryString).responseData { response in
            
            // parameter 위치
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                if let value = response.result.value {
                    
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                print(value)
                                let result = try decoder.decode(ProductSearch.self, from: value)
                                
                                //print("success")
                                completion(.success(result.data.searchList))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                            }
                        case 204:
                            completion(.requestErr("no result"))
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
                
            // 통신 실패 - 네트워크 연결
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            }
        }
    }
    
    func searchProduct(keyword: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let parameters: Parameters = [
            "query": keyword,
            "filter" : "product",
        ]
        
        Alamofire.request(APIConstants.SearchBaseURL, method: .get, parameters: parameters, encoding: URLEncoding.queryString).responseData { response in
            // parameter 위치
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                if let value = response.result.value {
                    
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                print(value)
                                let result = try decoder.decode(ProductSearch.self, from: value)
                                
                                //print("success")
                                completion(.success(result.data.searchList))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                            }
                        case 204:
                            completion(.requestErr("no result"))
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
                
            // 통신 실패 - 네트워크 연결
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            }
            
        }
    }
    
}
