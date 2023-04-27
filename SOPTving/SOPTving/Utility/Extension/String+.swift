//
//  String+.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation

extension String {
    
    var isEmailFormat: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
