//
//  AuthTextField.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/12.
//

import UIKit

import SnapKit
import Then


protocol TextFieldBuilder {
    func setPlaceholder(text: String, color: UIColor)
    func setTextColor(_ color: UIColor)
    func setLeftPaddingAmount(_ offset: CGFloat)
    
}

final class AuthTextFieldBuilder: TextFieldBuilder {

    private var textField = AuthTextField()
    
    func reset() {
        textField = AuthTextField()
    }
    
    func setPlaceholder(text: String, color: UIColor) {
        textField.placeholder = text
        textField.placeholderColor = color
    }
    
    func setTextColor(_ color: UIColor) {
        textField.textColor = color
    }
    
    func setLeftPaddingAmount(_ offset: CGFloat) {
        textField.leftPaddingOffset = offset
    }
    
    func build() -> AuthTextField {
        return textField
    }
}

class AuthTextFieldDirector {
    private var builder: AuthTextFieldBuilder?
    
    func update(builder: AuthTextFieldBuilder) {
        self.builder = builder
    }
    
    func buildIDTextField() {
        builder?.setLeftPaddingAmount(20)
        builder?.setTextColor(.white)
        builder?.setPlaceholder(text: "아이디", color: .tvingLightGray)
    }

    func buildPasswordTextField() {
        builder?.setLeftPaddingAmount(20)
        builder?.setTextColor(.white)
        builder?.setPlaceholder(text: "비밀번호", color: .tvingLightGray)
    }
    
    func build() -> AuthTextField {
        guard let builder else {
            print("가드문..")
            return AuthTextField() }
        return builder.build()
    }
    
    
}

final class AuthTextField : UITextField {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    
    private func style() {
        self.backgroundColor = .darkGray
    }
    
    //MARK: - Action Method
    
}
