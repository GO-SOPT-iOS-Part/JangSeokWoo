//
//  UIStackView+.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/10.
//

extension UIStackView {
    
    func addArrangedSubViews(_ views: UIView...){
        views.forEach {  self.addArrangedSubview($0) }
    }
    
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}

