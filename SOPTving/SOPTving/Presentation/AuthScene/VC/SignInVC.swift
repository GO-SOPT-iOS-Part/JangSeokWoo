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
    
//    private let idTextField = UITextField().then {
//        $0.placeholder = "아이디"
//        $0.placeholderColor = .tvingLightGray
//        $0.leftPaddingOffset = 20
//        $0.textColor = .white
//        $0.backgroundColor = .tvingDarkGray
//    }
    private let idTextField : AuthTextField = {
        let director = AuthTextFieldDirector()
        let builder = AuthTextFieldBuilder()
        director.update(builder: builder)
        director.buildIDTextField()
        return director.build()
    }()
    
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
                         idTextField)
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
    }
}

