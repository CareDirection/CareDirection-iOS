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

    static let idCheckURL = BaseURL + "/users/id"

    static let DuplicatedCheckIDURL = BaseURL + "/users/id"
    static let EditNickNameURL = BaseURL + "/users/nickname"
    
    // 유저-child 사용자 관리
    static let GetUserListURL = BaseURL + "/users/list"
    static let DeleteChildUserURL = BaseURL + "/users/child"
    
    // 설문조사
    static let AddUserInfoURL = BaseURL + "/users/info"
    static let AddLifeCycleInfoURL = BaseURL + "/survey/lifecycle"
    
    // 홈 화면
    static let GetGraphURL = BaseURL + "/graph"
    static let GetNutrientFunctionURL = BaseURL + "/nutrient/function"
    
    // 홈 - 상세
    static let GetMyNutrientDetailURL = BaseURL + "/nutrients/graph/detail"
    static let GetEfficacyListURL = BaseURL + "/efficacy/list"
    
    // 복용관리
    static let SearchDoseProductURL = BaseURL + "/search/dose/product" // 복용제품 추가시 상품 검색
    static let ProductDoseURL = BaseURL + "/product/dose" // 현재 복용중인 제품 목록
    static let ProductBaseURL = BaseURL + "/product" // 제품 Base URL
    
    // 상품
    static let ProductTapListURL = BaseURL + "/product/tabList" // 상품 탭 리스트
    static let SearchBaseURL = BaseURL + "/search" // 검색 Base URL
    
    // 성분학습-성분리스트
    static let NutrientsURL = BaseURL + "/nutrients" // 성분학습_성분학습리스트(6가지)
    static let EfficacyBaseUrl = BaseURL + "/efficacy" // 효능 Base URL
    
    // 성분학습-아티클리스트
    static let articleURL = BaseURL + "/article" // 아티클 - 리스트

}
