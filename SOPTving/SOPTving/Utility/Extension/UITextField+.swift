//
//  UITextField+.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/12.
//

import UIKit

extension UITextField {

    var placeholderColor: UIColor {
        get{
            return .black
        }
        set{
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                       attributes: [.foregroundColor: newValue,
                                                                    .font: font].compactMapValues { $0 })
        }
    }
    
    var leftPaddingOffset: CGFloat {
        get {
            return 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: newValue,
                                                   height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        
    }
}

