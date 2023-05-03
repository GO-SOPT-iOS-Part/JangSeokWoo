//
//  Setting.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/29.
//

import Foundation



struct MyPageSetting {
    
    enum UserSetting: String, CaseIterable {
        case memberShip = "이용권"
        case inquiryDetails = "1:1 문의내역"
        case reservation = "예약알림"
        case changeUserInfo = "회원정보수정"
        case acceptMessages = "프로모션정보수신동의"
    }

    enum AppSetting: String, CaseIterable {
        case notice = "공지사항"
        case event = "이벤트"
        case serviceCenter = "고객센터"
        case more = "티빙 알아보기"
    }
    
    var userSetting = UserSetting.allCases.map { $0.rawValue }
    var appSetting = AppSetting.allCases.map { $0.rawValue }
}


