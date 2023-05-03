//
//  MyPageProfileView.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import UIKit

final class MyPageProfileView: UIView {
    
    //MARK: - UI Components
    
    private let profileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile_tving.cute")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let nameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .small
        config.baseBackgroundColor = .clear
        config.image = UIImage(systemName: "pencil")
        config.imagePlacement = .trailing
        config.imagePadding = 5
        config.imageColorTransformer = .init({ _ in
            return .tvingLightGray
        })
        var subtitleAttr = AttributedString.init("장석우")
        subtitleAttr.font = .tvingSemiBold(ofSize: 23)
        config.attributedTitle = subtitleAttr
        
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    private let profileChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 전환", for: .normal)
        button.titleLabel?.font = .tvingMedium(ofSize: 14)
        button.setBorder(width: 1, color: .tvingLightGray)
        return button
    }()
    
    private let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingDarkGray
        return view
    }()
    
    private let memberShipImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "ticket")
        view.contentMode = .scaleAspectFit
        view.tintColor = .tvingLightGray
        return view
    }()
    
    private let memberShipLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 이용권"
        label.textColor = .tvingLightGray
        label.font = .tvingMedium(ofSize: 14)
        return label
    }()
    
    private let cashImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "c.circle")
        view.contentMode = .scaleAspectFit
        view.tintColor = .tvingLightGray
        return view
    }()
    
    private let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 캐시"
        label.textColor = .tvingLightGray
        label.font = .tvingMedium(ofSize: 14)
        return label
    }()
    
    private let myMemberShipButton = ButtonBuilder()
                                        .setTitle("어쩌구 저쩌구",
                                                  color: .white,
                                                  font: .tvingBold(ofSize: 16))
                                        .build()
    private let myCashButton = ButtonBuilder()
                                        .setTitle("캐시머니캐시",
                                                  color: .white,
                                                  font: .tvingBold(ofSize: 16))
                                        .build()
    
    private let memberShipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let cashStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let darkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.spacing = 14
        return stackView
    }()
    
    //MARK: - Life Cycle

    init() {
        super.init(frame: .zero)
        
        hierarchy()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileChangeButton.makeCornerRound(ratio: 10)
        darkView.makeCornerRound(ratio: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    //MARK: - Custom Method
    
    
    
    //MARK: - Action Method
    
    

}

//MARK: - Default Methods

extension MyPageProfileView {
    private func style() {
        print(#function)
    }
    
    private func hierarchy() {
        self.addSubviews(profileImageView,
                         nameButton,
                         profileChangeButton,
                         darkView)
        
        memberShipStackView.addArrangedSubViews(memberShipImageView,
                                                memberShipLabel,
                                                myMemberShipButton)
        
        cashStackView.addArrangedSubViews(cashImageView,
                                          cashLabel,
                                          myCashButton)
        
        darkStackView.addArrangedSubViews(memberShipStackView, cashStackView)
        
        darkView.addSubviews(darkStackView)
    }
    
    private func layout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview()
            $0.size.equalTo(80)
        }
        
        nameButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing)
        }
        profileChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        
        darkView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
        }
        
        darkStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
        
        memberShipImageView.snp.makeConstraints {
            $0.size.equalTo(23)
        }

        cashImageView.snp.makeConstraints {
            $0.size.equalTo(23)
        }
        
        memberShipLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(memberShipImageView)
        }
        
        cashLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(cashImageView)
        }
    }
}
