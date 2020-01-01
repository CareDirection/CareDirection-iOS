//
//  AuthService.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire

struct AuthService {

static let shared = AuthService()

// NetworkResult 파일에 통신 상태 5가지를 명시했었음 --> 이게 모델이 됨
// @escaping에 명시한 모델을 반환하여 그에 따라 다르게 처리


/**
 로그인 통신 메소드
 **/

func login(_ id: String, _ pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    let body: Parameters = [
        "user_id" : id,
        "user_pw" : pw
    ]
    
    
    Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        .responseData { response in
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
                                let result = try decoder.decode(ResponseString.self, from: value)
                                
                                print("success")
                                completion(.success(result.data))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                                print(APIConstants.LoginURL)
                            }
                        case 400:
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
} // func login


/**
 회원가입 통신 메소드
 **/

func signup(_ id: String, _ pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {
    
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    let body: Parameters = [
        "user_id" : id,
        "user_pw" : pw
    ]
    
    Alamofire.request(APIConstants.SignUpURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        .responseData { response in
            // parameter 위치
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                if let value = response.result.value {
                    
                    // 서버가 보내는 http Header에 담긴 status code
                    // Rest API에서 통신을 성공했던 실패했던 네트워크 통신이 성공했기 때문에 발생
                    // 서버가 예측한 질문에 대해 응답이 왔다면 200 status code
                    // 이제부터 서버 개발자가 분기할 코드에 대해 작성함 ex) 택배와 택배기사
                    if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print(value)
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    
                                    print("success")
                                    completion(.success(result.data))
                                }
                                catch {
                                    completion(.pathErr)
                                    
                                }
                                
                            case 400:
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
}
