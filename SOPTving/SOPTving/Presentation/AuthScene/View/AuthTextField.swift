//
//  AuthTextField.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/12.
//

import UIKit

import SnapKit
import Then

protocol AuthTextFieldDelegate: AnyObject {
    func authTextFieldTextDidChange(_ textFieldType: AuthTextField.TextFieldType, text: String)
    func authTextFieldDidReturn(_ textFieldType: AuthTextField.TextFieldType)
}

final class AuthTextField : UITextField {
    
    //MARK: - Properties
    
    
    enum TextFieldType {
        case email
        case password
        
        var isSecureTextEntry: Bool {
            switch self {
            case .email: return false
            case .password: return true
            }
        }
    }
    
    enum RightButtonType : Int{
        case clearButton
        case hideButton
    }
    
    private var textFieldType: TextFieldType
    weak var authDelegate: AuthTextFieldDelegate?
    
    
    //MARK: - UI Components
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .tvingLightGray
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.tintColor = .tvingLightGray
        button.contentMode = .scaleAspectFit
        button.isSelected = true
        button.addTarget(self, action: #selector(hideButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    //MARK: - Life Cycle
    
    init(viewType: TextFieldType = .email) {
        self.textFieldType = viewType
        super.init(frame: .zero)
        
        delegate()
        style()
        layout()
        
        updateClearButtonUI()
        updateEditingUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func delegate() {
        delegate = self
    }
    
    private func style() {
        self.autocapitalizationType = .none
        self.rightView = rightStackView
        self.rightViewMode = .whileEditing
        self.isSecureTextEntry = textFieldType.isSecureTextEntry
        self.backgroundColor = .darkGray
    }
    
    private func layout() {
        rightStackView.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(100)
        }
    }
    
    private func updateEditingUI() {
        let color: UIColor = isEditing ? .white : .clear
        setBorder(width: 1, color: color)
    }
    
    private func updateClearButtonUI() {
        clearButton.isHidden = !hasText
    }
    
    //MARK: - Public Method
    
    public func addRightButton(_ rightButtonType: RightButtonType) {
        switch rightButtonType {
        case .clearButton:
            rightStackView.addArrangedSubview(clearButton)
        case .hideButton:
            rightStackView.addArrangedSubview(secureButton)
        }
    }
    
    //MARK: - Action Method
    
    @objc
    private func clearButtonDidTap() {
        text = ""
    }
    
    @objc
    private func hideButtonDidTap() {
        secureButton.isSelected.toggle()
        isSecureTextEntry = secureButton.isSelected
    }
}

//MARK: - UITextFieldDelegate

extension AuthTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateEditingUI()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authDelegate?.authTextFieldDidReturn(textFieldType)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateEditingUI()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return}
        updateClearButtonUI()
        authDelegate?.authTextFieldTextDidChange(textFieldType, text: text)
    }

}
