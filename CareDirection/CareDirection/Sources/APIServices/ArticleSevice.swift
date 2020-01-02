//
//  ArticleSevice.swift
//  CareDirection
//
//  Created by 안재은 on 02/01/2020.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct ArticleService {
    static let shared = ArticleService()
    
    func showArticleMain(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.articleURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
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
                                    let result = try decoder.decode(ResponseArray<Article>.self, from: value)
                                    
                                    //switch result.success {
                                    //case true:
                                        completion(.success(result.data!))
                                    //case false:
                                    //    completion(.requestErr(result.message))
                                    //}
                                } catch {
                                    completion(.pathErr)
                                }
                            case 400, 401:
                                completion(.pathErr)
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
    
    func showArticleDetail(articleIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.articleURL + "/\(articleIdx)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
        ]
        
        let paramaters : Parameters = [
            "article_idx" : 2
        ]
        
        Alamofire.request(URL, method: .get, parameters: paramaters, encoding: URLEncoding.queryString, headers: header)
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
                                    
                                    let result = try decoder.decode(ResponseArticle.self, from: value)
                                    completion(.success(result.data!))
                                    
                                } catch {
                                    completion(.pathErr)
                                }
                            case 400, 401:
                                completion(.pathErr)
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
