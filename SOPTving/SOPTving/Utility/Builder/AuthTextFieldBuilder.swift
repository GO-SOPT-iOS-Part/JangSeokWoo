//
//  AuthTextFieldBuilder.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/13.
//

import UIKit

protocol TextFieldBuilder {
    func setText(color: UIColor, font: UIFont) -> Self
    func setPlaceholder(text: String, color: UIColor) -> Self
    func setLeftPaddingAmount(_ offset: CGFloat) -> Self
    func setCornerRadius(_ radius: CGFloat) -> Self
}

//MARK: - Builder

final class AuthTextFieldBuilder: TextFieldBuilder {
    
    //MARK: UI Components
    
    private var textField = AuthTextField()
    
    //MARK: Life Cycle
    
    init(viewType: AuthTextField.TextFieldType) {
        textField = AuthTextField(viewType: viewType)
    }
    
    func build() -> AuthTextField {
        return textField
    }
    
    //MARK: Custom Method
    
    @discardableResult
    func setPlaceholder(text: String, color: UIColor) -> Self {
        textField.placeholder = text
        textField.placeholderColor = color
        return self
    }
    
    @discardableResult
    func setText(color: UIColor, font: UIFont) -> Self {
        textField.textColor = color
        textField.font = font
        return self
    }
    
    @discardableResult
    func setLeftPaddingAmount(_ offset: CGFloat) -> Self {
        textField.leftPaddingOffset = offset
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> Self {
        textField.makeCornerRound(radius: radius)
        return self
    }
    
    @discardableResult
    func addRightButton(_ button: AuthTextField.RightButtonType) -> Self {
        textField.addRightButton(button)
        return self
    }
    
}


//MARK: - Director

final class AuthTextFieldDirector {
    
    private var builder: AuthTextFieldBuilder?
    
    func update(builder: AuthTextFieldBuilder) {
        self.builder = builder
    }
    
    func buildEmailTextField() -> AuthTextField {
        
        builder = AuthTextFieldBuilder(viewType: .email)
                                        .setText(color: .white, font: .tvingSemiBold(ofSize: 16))
                                        .setPlaceholder(text: "아이디", color: .tvingLightGray)
                                        .setLeftPaddingAmount(22)
                                        .setCornerRadius(6)
                                        .addRightButton(.clearButton)
        guard let builder else { return AuthTextField() }
        return builder.build()
    }

    func buildPasswordTextField() -> AuthTextField {
        
        builder = AuthTextFieldBuilder(viewType: .password)
                                        .setLeftPaddingAmount(20)
                                        .setText(color: .white, font: .tvingMedium(ofSize: 16))
                                        .setPlaceholder(text: "비밀번호", color: .tvingLightGray)
                                        .setCornerRadius(6)
                                        .addRightButton(.clearButton)
                                        .addRightButton(.hideButton)
        
        guard let builder else { return AuthTextField() }
        return builder.build()
    }
    
    
}

//MARK: - AuthTextField

