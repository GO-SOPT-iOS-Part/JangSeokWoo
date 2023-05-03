//
//  MyPageSettingFooterView.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/29.
//

import UIKit

final class MyPageSettingFooterView: UIView {
    
    //MARK: - Properties
    
    private let isLastSection: Bool
    
    //MARK: - UI Components
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingDarkGray
        return view
    }()
    
    private let logoutButton : UIButton = {
        let button = UIButton()
        button.setBorder(width: 1, color: .tvingDarkGray)
        button.makeCornerRound(ratio: 20)
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.tvingLightGray, for: .normal)
        button.titleLabel?.font = .tvingMedium(ofSize: 14)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [seperatorView,logoutButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    //MARK: - Life Cycle

    
    init(isLastSection: Bool) {
        self.isLastSection = isLastSection
        super.init(frame: .zero)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func style() {
        seperatorView.isHidden = isLastSection
        logoutButton.isHidden = !isLastSection
    }
    
    private func hierarchy() {
        self.addSubviews(vStackView)
    }
    
    private func layout() {
        
        vStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        seperatorView.snp.makeConstraints {
            $0.width.equalToSuperview().inset(10)
            $0.height.equalTo(1)
        }
        
        logoutButton.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(54)
        }
    }
}
