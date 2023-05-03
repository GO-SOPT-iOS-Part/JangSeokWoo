//
//  TvingColor.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/10.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    static var tvingRed: UIColor {
        return UIColor(r: 234, g: 51, b: 58)
    }
    
    static var tvingDarkGray: UIColor {
        return UIColor(r: 46, g: 46, b: 46)
    }
    
    static var tvingLightGray: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }
}
