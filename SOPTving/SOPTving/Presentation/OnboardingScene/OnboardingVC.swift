//
//  ViewController.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

class OnboardingVC: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let startLabel = UIButton().then {
        $0.setTitle("티빙 시작하기", for: .normal)
        $0.backgroundColor = .tvingRed
    }
    
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        heirarchy()
        layout()
    }
    

}

//MARK: - Methods

extension OnboardingVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func heirarchy() {
        view.addSubview(startLabel)
    }
    
    private func layout() {
        startLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }
}

//MARK: - UI & Layout

extension OnboardingVC {
    
}
