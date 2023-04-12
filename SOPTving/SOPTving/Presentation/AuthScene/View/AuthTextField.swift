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
    
    init(viewType: AuthTextField.ViewType) {
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
    
    func buildIDTextField() -> AuthTextField {
        
        builder = AuthTextFieldBuilder(viewType: .id)
                                        .setLeftPaddingAmount(20)
                                        .setText(color: .white, font: .tvingMedium(ofSize: 16))
                                        .setPlaceholder(text: "아이디", color: .tvingLightGray)
                                        .setCornerRadius(8)
                                        .addRightButton(.clearButton)
        guard let builder else { return AuthTextField() }
        return builder.build()
    }

    func buildPasswordTextField() -> AuthTextField {
        
        builder = AuthTextFieldBuilder(viewType: .password)
                                        .setLeftPaddingAmount(20)
                                        .setText(color: .white, font: .tvingMedium(ofSize: 16))
                                        .setPlaceholder(text: "비밀번호", color: .tvingLightGray)
                                        .setCornerRadius(8)
                                        .addRightButton(.clearButton)
                                        .addRightButton(.hideButton)
        
        guard let builder else { return AuthTextField() }
        return builder.build()
    }
    
    
}

//MARK: - AuthTextField

final class AuthTextField : UITextField, UITextFieldDelegate {
    
    //MARK: - Properties
    
    enum ViewType {
        case id
        case password
    }
    
    enum RightButtonType : Int{
        case clearButton
        case hideButton
    }
    
    private var viewType: ViewType = .id
    
    
    private var rightButtonTypes: [RightButtonType] = [] {
        didSet{
            setRightView()
        }
    }
    
    
    //MARK: - UI Components
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .tvingLightGray
        button.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.tintColor = .tvingLightGray
        button.addTarget(self, action: #selector(hideButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    //MARK: - Life Cycle
    
    init(viewType: ViewType = .id) {
        self.viewType = viewType
        super.init(frame: .zero)
        
        configure()
        setRightView()
        updateClearButtonUI()
        updateEditingUI()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func configure() {
        
        delegate = self
        rightViewMode = .always
        rightView = rightStackView
        
        switch viewType {
        case .id:
            isSecureTextEntry = false
        case .password:
            isSecureTextEntry = true
            hideButton.isSelected = true
        }
    }
    
    private func style() {
        backgroundColor = .darkGray
    }
    
    private func layout() {
        rightStackView.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(80)
        }
    }
    
    private func setRightView() {
        rightStackView.removeAllArrangedSubviews()
        for type in rightButtonTypes {
            switch type {
            case .clearButton:
                rightStackView.addArrangedSubview(clearButton)
            case .hideButton:
                rightStackView.addArrangedSubview(hideButton)
            }
        }
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        rightStackView.addArrangedSubview(paddingView)
    }
    
    private func updateEditingUI() {
        if isEditing {
            setBorder(width: 1.5, color: .tvingLightGray)
            rightView?.isHidden = false
        } else {
            setBorder(width: 1, color: .clear)
            rightView?.isHidden = true
        }
    }
    
    private func updateClearButtonUI() {
        if hasText {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
    
    //MARK: - Public Method
    
    public func addRightButton(_ rightButtonType: RightButtonType) {
        rightButtonTypes.append(rightButtonType)
    }
    
    //MARK: - Action Method
    
    @objc
    private func clearButtonDidTap() {
        text = ""
    }
    
    @objc
    private func hideButtonDidTap() {
        hideButton.isSelected.toggle()
        isSecureTextEntry = hideButton.isSelected
    }
}

extension AuthTextField: UITextViewDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateEditingUI()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateEditingUI()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateClearButtonUI()
    }

}
