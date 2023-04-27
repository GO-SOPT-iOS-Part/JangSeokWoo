//
//  SignInVC.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/10.
//

import UIKit
import Combine

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
    
    //  빌더패턴
    //  그냥 TextField에 프로퍼티 줄어든 버전이랄까
    //  기본 프로퍼티만 추가할땐 그닥 효율성 못느낌.
    //  addRightButton 과 같은 함수 추가할땐 좋은 패턴인듯.
    private let idTextField = AuthTextFieldBuilder(viewType: .id)
                                .setText(color: .white, font: .tvingSemiBold(ofSize: 16))
                                .setPlaceholder(text: "아이디", color: .tvingLightGray)
                                .setLeftPaddingAmount(22)
                                .setCornerRadius(6)
                                .addRightButton(.clearButton)
                                .build()
    
    // 빌더 패턴에 디럭터 패턴까지 적용시킨 버전
    // 디렉터까지 하면 모듈화하긴 좋을듯
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
        
        target()
        binding()
        style()
        hierarchy()
        layout()
        updateSignInButtonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods

extension SignInVC {
    
    private func target() {
        idTextField.setUpdateHandler { [weak self] in
            guard let self else { return }
            self.updateSignInButtonUI()
        }
        
        passwordTextField.setUpdateHandler { [weak self] in
            guard let self else { return }
            self.updateSignInButtonUI()
        }
    }
    
    private func binding() {
        
    }
    
    // 이부분을 뷰모델이 했으면 좋겠다
    private func updateSignInButtonUI() {
        let isEnabled = idTextField.hasText && passwordTextField.hasText
        
        
        let backgroundColor: UIColor = isEnabled ? .tvingRed : .black
        let borderColor: UIColor = isEnabled ? .tvingRed : .tvingLightGray
        
        signInButton.setBorder(width: 1, color: borderColor)
        signInButton.backgroundColor = backgroundColor
        signInButton.isEnabled = isEnabled
    }
    
    //MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc
    private func signInButtonDidTap() {
        let mainVC = MainVC()
        UIApplication.shared.changeRootViewController(mainVC)
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
                         idTextField,
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
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(passwordTextField)
            $0.size.equalTo(passwordTextField)
        }
    }
}

