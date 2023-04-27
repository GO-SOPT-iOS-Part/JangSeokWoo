//
//  SignInVC.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/10.
//

import UIKit

import SnapKit
import Then

final class SignInVC: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: SignInViewModel

    //MARK: - UI Components
    
    private lazy var backButton = UIButton().then {
        $0.tintColor = .white
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.addTarget(self,
                     action: #selector(backButtonDidTap),
                     for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "TVING 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .white
    }
    
    private let emailTextField = AuthTextFieldDirector().buildEmailTextField()
    private let passwordTextField = AuthTextFieldDirector().buildPasswordTextField()
    
    private lazy var signInButton = UIButton().then {
        $0.setTitle("로그인 하기", for: .normal)
        $0.titleLabel?.textColor = .tvingLightGray
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 16)
        $0.backgroundColor = .tvingRed
        $0.makeCornerRound(radius: 6)
        $0.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: - Life Cycle
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        bind()
        
        style()
        hierarchy()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods

extension SignInVC {
    
    private func delegate() {
        emailTextField.authDelegate = self
        passwordTextField.authDelegate = self
    }
    
    private func bind() {
        viewModel.ableToSignIn.observe(on: self) { [weak self] isEnabled in
            self?.updateSignInButtonUI(isEnabled)
        }
        
        viewModel.isSuccessLogin.observe(on: self) { [weak self] result in
            switch result {
            case .success(_):
                self?.goToMainVC()
            case .failure(let error):
                self?.presentTopAlert(error.message)
            }
        }
    }
    
    private func updateSignInButtonUI(_ isEnabled: Bool) {
    
        let backgroundColor: UIColor = isEnabled ? .tvingRed : .black
        let borderColor: UIColor = isEnabled ? .tvingRed : .tvingLightGray
        
        signInButton.setBorder(width: 1, color: borderColor)
        signInButton.backgroundColor = backgroundColor
        signInButton.isEnabled = isEnabled
    }
    
    private func goToMainVC() {
        let mainVC = MainVC()
        UIApplication.shared.changeRootViewController(mainVC)
    }
    
    //MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc
    private func signInButtonDidTap() {
        view.endEditing(true)
        viewModel.signInButtonDidTapEvent()
    }
}

//MARK: - UI & Layout

extension SignInVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(backButton,
                         titleLabel,
                         emailTextField,
                         passwordTextField,
                         signInButton)
    }
    
    private func layout() {
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(passwordTextField)
            $0.size.equalTo(passwordTextField)
        }
    }
}

//MARK: - AuthTextFieldDelegate

extension SignInVC: AuthTextFieldDelegate {
    
    func authTextFieldDidReturn(_ textFieldType: AuthTextField.TextFieldType) {
        switch textFieldType {
        case .email:
            passwordTextField.becomeFirstResponder()
        case .password:
            view.endEditing(true)
            signInButtonDidTap()
        }
    }
    
    
    func authTextFieldTextDidChange(_ textFieldType: AuthTextField.TextFieldType, text: String) {
        switch textFieldType {
        case .email:
            self.viewModel.emailTextFieldDidChangeEvent(text)
        case .password:
            self.viewModel.passwordTextFieldDidChangeEvent(text)
        }
    }
}
