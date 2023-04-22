//
//  Int+.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/22.
//

import Foundation

extension Int {
    
    var priceText: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            var priceString = numberFormatter.string(for: self) ?? "0"
            priceString = priceString + "원"
            return priceString
        }
    
    }
    
}
