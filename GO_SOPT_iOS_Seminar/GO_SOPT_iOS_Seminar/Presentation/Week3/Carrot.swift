//
//  Carrot.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/22.
//

import UIKit

struct Carrot {
    let image: UIImage
    let product: String
    let place: String
    let time: String
    let tradeStatus: Trade
    let price: Int
}

extension Carrot {
    
    static func dummy() -> [Carrot] {
        return [Carrot(image: .hypeBoy,
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .completed,
                       price: 200000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "4월 2일",
                       tradeStatus: .reservation,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "6시간 전",
                       tradeStatus: .completed,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .clear,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .completed,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reservation,
                       price: 0)]
    }
}

