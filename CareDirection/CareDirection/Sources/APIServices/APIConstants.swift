//
//  APIConstants.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

struct APIConstants {
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용
    static let BaseURL = "http://13.124.134.215:3000"
    //static let AuthURL = BaseURL + "/auth"
    
    // 회원가입, 로그인 통신
    static let SignUpURL = BaseURL + "/users/signup"
    static let LoginURL = BaseURL + "/users/signin"
   
}
