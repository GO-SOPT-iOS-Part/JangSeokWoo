//
//  UIViewBuilder.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/22.
//

import UIKit

protocol ViewBuildable {
    func setBackGroundColor(_ color: UIColor) -> Self
    func setCornerRadius(_ radius: CGFloat) -> Self
}

//MARK: - Builder

class ViewBuilder: ViewBuildable {
    
    //MARK: UI Components
    var view = UIView()
    
    //MARK: Life Cycle
    
    init() {
        print("뷰빌더 init")
    }
    
    func build() -> UIView {
        return view
    }
    
    //MARK: Custom Method
    
    @discardableResult
    func setBackGroundColor(_ color: UIColor) -> Self {
        view.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> Self {
        view.makeCornerRound(radius: radius)
        return self
    }
}


//MARK: - Director


//MARK: - AuthTextField

