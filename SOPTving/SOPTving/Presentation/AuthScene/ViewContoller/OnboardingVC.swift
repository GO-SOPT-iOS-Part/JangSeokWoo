//
//  ViewController.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

final class OnboardingVC: UIViewController {
    
    //MARK: - Properties
    
    
    //MARK: - UI Components
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboarding")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var startButton = UIButton().then {
        $0.setTitle("티빙 시작하기", for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 18)
        $0.backgroundColor = .tvingRed
        $0.makeCornerRound(radius: 7)
        $0.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        hierarchy()
        layout()
    }
    
}

//MARK: - Methods

extension OnboardingVC {
  
    private func binding() {
        
    }
    
    @objc
    private func startButtonDidTap() {
        let signInVC = SignInVC(viewModel: DefaultSignInViewModel(email: "", password: ""))
        present(signInVC, animated: true)
    }
}

//MARK: - UI & Layout

extension OnboardingVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(onboardingImageView,
                         startButton)
    }
    
    private func layout() {
        onboardingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(startButton.snp.top).offset(-20)
        }
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
