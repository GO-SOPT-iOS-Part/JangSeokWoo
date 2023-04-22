//
//  MainVC.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/13.
//

import UIKit

import SnapKit
import Then

final class MainVC: UIViewController {
    
    //MARK: - Properties
    
    private var name: String? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - UI Components
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingSemiBold(ofSize: 20)
        label.text = "gd"
        label.textColor = .white
        return label
    }()
    
    private lazy var nextButton = ButtonBuilder()
                                    .setTitle("다음으로",
                                             color: .white,
                                             font: .tvingSemiBold(ofSize: 16))
                                    .setBackGroundColor(.systemBlue)
                                    .setCornerRadius(12)
                                    .setAction { [weak self] _ in
                                        self?.nextButtonDidTap()
                                    }
                                    .build()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        hierarchy()
        layout()
    }
    
}

//MARK: - Methods

extension MainVC {
    
    private func updateUI() {
        profileLabel.text = name
    }
    
    //MARK: Public
    
    public func dataBind(_ text: String) {
        self.name = text
    }
    
}

//MARK: - Action Method

extension MainVC {
    func nextButtonDidTap() {
        
    }
}





//MARK: - UI & Layout

extension MainVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(profileLabel, nextButton)
    }
    
    private func layout() {
        profileLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileLabel.snp.bottom).offset(100)
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
        
    }
}

