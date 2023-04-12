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

class SignInVC: UIViewController {
    
    //MARK: - Properties
    
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
    // 기본 프로퍼티만 추가할땐 그닥 효율성 못느낌.
    // addRightButton 과 같은 함수 추가할땐 좋은 패턴인듯.
    private let idTextField = AuthTextFieldBuilder(viewType: .id)
                                .setText(color: .white, font: .tvingSemiBold(ofSize: 16))
                                .setPlaceholder(text: "아이디", color: .tvingLightGray)
                                .setLeftPaddingAmount(22)
                                .setCornerRadius(8)
                                .addRightButton(.clearButton)
                                .build()
    
    // 빌더 패턴에 디럭터 패턴까지 적용시킨 버전
    // 디렉터까지 하면 모듈화하긴 좋을듯
    private let passwordTextField = AuthTextFieldDirector().buildPasswordTextField()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
        style()
        hierarchy()
        layout()
    }
    
}

//MARK: - Methods

extension SignInVC {
    
    private func binding() {
        
    }
    
    //MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true)
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
                         passwordTextField)
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
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
    }
}

