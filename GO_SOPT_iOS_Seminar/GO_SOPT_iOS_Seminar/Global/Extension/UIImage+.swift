//
//  UIImage.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/08.
//

import UIKit

extension UIImage {
    var heightPerWidth: CGFloat {
        get {
            let ratio = self.size.height / self.size.width
            return ratio
        }
    }
    
    var widthPerHeight: CGFloat {
        get {
            let ratio = self.size.width / self.size.height
            return ratio
        }
    }
}
