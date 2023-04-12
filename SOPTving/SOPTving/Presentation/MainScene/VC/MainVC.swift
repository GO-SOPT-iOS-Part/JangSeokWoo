//
//  MainVC.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/13.
//

import UIKit

import SnapKit
import Then

class MainVC: UIViewController {
    
    //MARK: - Properties
    
    private var name: String? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - UI Components
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_tving.cute")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingSemiBold(ofSize: 20)
        label.textColor = .white
        return label
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

extension MainVC {
    
    private func binding() {
        
    }
    
    private func updateUI() {
        profileLabel.text = name
    }
    
    //MARK: Public
    
    public func dataBind(_ text: String) {
        self.name = text
    }
    
}





//MARK: - UI & Layout

extension MainVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(profileImageView,
                         profileLabel)
    }
    
    private func layout() {
        profileImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(80)
        }
        
        profileLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.centerX.equalTo(profileImageView)
        }
        
    }
}

