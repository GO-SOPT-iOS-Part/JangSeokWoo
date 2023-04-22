//
//  SeungChanViewController.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/08.
//

import UIKit

import SnapKit

final class FirstViewController_Week2_FisrtPractice : UIViewController {
    
    //MARK: - Properties
    
    private var count: Int = 0 {
        didSet{
            countLabel.text = "누른 횟수: \(count)"
        }
    }
    
    //MARK: - UI Components
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "누른 횟수: 0"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.makeCornerRound(radius: 10)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("다음으로", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.makeCornerRound(radius: 10)
        button.addTarget(self,
                         action: #selector(nextButtonDidTap),
                         for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        hierarchy()
        layout()
    }
    
    //MARK: - Default Method
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func hierarchy() {
        view.addSubviews(countLabel, nextButton)
    }
    
    private func layout() {
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(100)
            $0.height.equalTo(60)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(80)
        }
        
    }
    
    //MARK: - Action Method
    
    @objc
    private func nextButtonDidTap() {
        clearData()
        presentSecondViewController()
    }
    
}

private extension FirstViewController_Week2_FisrtPractice {
    
    func presentSecondViewController() {
        let secondVC = SecondViewController_Week2_FirstPractice()
        secondVC.dataBind { [weak self] count in
            self?.count = count
        }
        present(secondVC, animated: true)
        
    }
    
    private func clearData() {
        count = 0
    }
}
