//
//  ButtonBuilder.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/22.
//

import UIKit

protocol ButtonBuildable: ViewBuildable {
    
    func setTitle(_ text: String,
                 color: UIColor,
                 font: UIFont,
                 state: UIControl.State ) -> Self
    
    func setImage(_ image: UIImage,
                  contentMode: UIView.ContentMode,
                  state: UIControl.State) -> Self
    
    func setAction(event: UIControl.Event,
                   handler: @escaping UIActionHandler) -> Self
}

//MARK: - Builder

final class ButtonBuilder: ButtonBuildable {
    
    //MARK: UI Components
    private var button = UIButton()
    
    //MARK: Life Cycle
    
    func build() -> UIButton {
        return button
    }
    
    //MARK: Custom Method
    
    @discardableResult
    func setBackGroundColor(_ color: UIColor) -> Self {
        button.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> Self {
        button.makeCornerRound(radius: radius)
        return self
    }
    
    @discardableResult
    func setTitle(_ text: String,
                 color: UIColor,
                 font: UIFont ,
                 state: UIControl.State = .normal) -> Self {
        button.setTitle(text, for: state)
        button.setTitleColor(color, for: state)
        button.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage,
                  contentMode: UIView.ContentMode = .scaleAspectFit,
                  state: UIControl.State = .normal) -> Self {
        button.setImage(image, for: state)
        button.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func setAction(event: UIControl.Event = .touchUpInside,
                   handler: @escaping UIActionHandler) -> Self {
        let action = UIAction(handler: handler)
        button.addAction(action, for: event)
        return self
    }
    
}


//MARK: - Director


//MARK: - AuthTextField

