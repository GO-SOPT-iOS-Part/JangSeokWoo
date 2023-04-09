//
//  SeungChanHitViewController.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/08.
//

import UIKit

import SnapKit

final class SecondViewController_Week2_FirstPractice : UIViewController {
    
    //MARK: - Properties
    
    private var count: Int = 0
    
    typealias handler = ((Int) -> Void)
    private var completionHandler: handler?
    
    //MARK: - UI Components
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self,
                         action: #selector(dismissButtonDidTap),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pressButton: UIButton = {
        var config = UIButton.Configuration.filled()
        
        config.title = "버튼 누르기"
        config.attributedTitle?.font = .systemFont(ofSize: 20, weight: .semibold)
        
        let handler: UIButton.ConfigurationUpdateHandler = { button in
            switch button.state {
            case .normal:
                button.configuration?.baseBackgroundColor = .systemBlue
            default:
                button.configuration?.baseBackgroundColor = .blue
            }
        }
        
        let button = UIButton()
        button.addTarget(self, action: #selector(pressButtonDidTap), for: .touchUpInside)
        button.configurationUpdateHandler = handler
        button.configuration = config
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        hierarchy()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pressButton.makeCornerRound(ratio: 2)
    }
    
    //MARK: - Custom Method
    
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func hierarchy() {
        view.addSubviews(dismissButton, pressButton)
    }
    
    private func layout() {
        dismissButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(25)
        }
        
        pressButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(150)
        }
    }
    
    func dataBind(completion: @escaping handler) {
        completionHandler = completion
    }
    
    //MARK: - Action Method
    
    @objc
    private func pressButtonDidTap() {
        count += 1;
        completionHandler?(count)
    }
    
    @objc
    private func dismissButtonDidTap() {
        dismiss(animated: true)
    }
    
}

private extension SecondViewController_Week2_FirstPractice {
    
    
}

