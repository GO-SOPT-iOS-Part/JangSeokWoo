//
//  NSObject+.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/22.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
