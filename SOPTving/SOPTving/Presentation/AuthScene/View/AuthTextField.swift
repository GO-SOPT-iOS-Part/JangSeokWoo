//
//  AuthTextField.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/12.
//

import UIKit

import SnapKit
import Then

final class AuthTextField : UITextField, UITextFieldDelegate {
    
    //MARK: - Properties
    
    typealias handler = (() -> Void)
    private var completionHandler: handler?
    
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
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.tintColor = .tvingLightGray
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hideButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
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
            $0.width.lessThanOrEqualTo(100)
        }
    }
    
    private func updateEditingUI() {
        let color: UIColor = isEditing ? .white : .clear
        
        setBorder(width: 1, color: color)
        rightView?.isHidden = !isEditing
    }
    
    private func updateClearButtonUI() {
        clearButton.isHidden = !hasText
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
    
    //MARK: - Public Method
    
    public func addRightButton(_ rightButtonType: RightButtonType) {
        rightButtonTypes.append(rightButtonType)
    }
    
    public func setCompletion(completion: @escaping handler) {
        completionHandler = completion
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateEditingUI()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateClearButtonUI()
        completionHandler?()
    }

}
