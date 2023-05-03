//
//  UserProfile.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation


struct MemberShip {
    
    enum MemberShipType: String {
        case basic = "베이직"
        case standatd = "스탠다드"
        case premium = "프리미엄"
    }
    
    enum Period: String {
        case annual = "연간"
        case monthly = "월간"
    }
    
    var type: MemberShipType
    var period: Period
}


struct MyProfile {
    var name: String
    var imageURL: String
    var memberShip: MemberShip
    var cash: Int
}

extension MyProfile {
    static func dummyData() -> MyProfile {
        let data = MyProfile(name: "장석우",
                             imageURL: "profile_tving.cute",
                             memberShip: MemberShip(type: .standatd,
                                                    period: .annual),
                             cash: 0)
        return data
    }
}
