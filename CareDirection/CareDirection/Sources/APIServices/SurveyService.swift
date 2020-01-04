//
//  SurveyService.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/01.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Alamofire


struct SurveyService {
    static let shared = SurveyService()

    func personalInfo(name: String, gender: Int, birth: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let token = UserDefaults.standard
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            //"token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MjQsImlhdCI6MTU3Nzg3NzY1NiwiZXhwIjo4Nzk3Nzg3NzY1NiwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.WysKIH3-qDf3GTR-RKKl23hp_9byodzDm7TdISMTkmk"
            "token" : "\(token.string(forKey: "token")!)"
        ]

        let body : Parameters = [
            "user_name": name,
            "user_gender": gender,
            "user_birth": birth
        ]

        Alamofire.request(APIConstants.AddUserInfoURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
            switch response.result{
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode{
                        switch status {
                        case 201:
                            do {
                                completion(.success("설문조사 성공"))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                            }
                        case 403:
                            completion(.requestErr("유효하지 않은 token 입니다."))
                        case 500:
                            print("서버 내부 에러")
                            completion(.serverErr)
                        default:
                            print(status)
                            break
                        }
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }

    }
    
    func lifeStyleInfo(answer1: String, answer2: String, answer3: String, answer4: String, answer5: String, answer6: String, answer7: String, completion: @escaping (NetworkResult<Any>) -> Void){
        let token = UserDefaults.standard

        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            //"token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MjQsImlhdCI6MTU3Nzg3NzY1NiwiZXhwIjo4Nzk3Nzg3NzY1NiwiaXNzIjoiY2FyZS1kaXJlY3Rpb24ifQ.WysKIH3-qDf3GTR-RKKl23hp_9byodzDm7TdISMTkmk"
            "token" : "\(token.string(forKey: "token")!)"
        ]

        let body : Parameters = [
            "user_survey_item_value1": answer1,
            "user_survey_item_value2": answer2,
            "user_survey_item_value3": answer3,
            "user_survey_item_value4": answer4,
            "user_survey_item_value5": answer5,
            "user_survey_item_value6": answer6,
            "user_survey_item_value7": answer7
        ]
        
        Alamofire.request(APIConstants.AddLifeCycleInfoURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
            switch response.result{
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode{
                        switch status {
                        case 201:
                            do {
                                print("success")
                                completion(.success("설문조사 성공"))
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                            }
                        case 403:
                            print("유효하지 않은 token 입니다.")
                            completion(.requestErr("유효하지 않은 token 입니다."))
                        case 500:
                            print("서버 내부 에러")
                            completion(.serverErr)
                        default:
                            break
                        }
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
        
    }
}
