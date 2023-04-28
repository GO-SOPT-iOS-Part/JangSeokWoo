//
//  MyPageVC.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import UIKit

import SnapKit

final class MyPageVC: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: MyPageViewModel

    //MARK: - UI Components
    
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self,
                     action: #selector(backButtonDidTap),
                     for: .touchUpInside)
        return button
    }()
    
    private let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.bounces = false
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    private let contentView = UIView()
    
    private let profileView = MyPageProfileView()
    
    
    //MARK: - Life Cycle
    
    init(viewModel: MyPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        
        
        style()
        hierarchy()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods

extension MyPageVC {
    
    private func delegate() {
        
    }
    
    private func bind() {
     
    }
    
    
    //MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    
}

//MARK: - UI & Layout

extension MyPageVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(navigationView,
                         scrollView)
        
        navigationView.addSubview(backButton)
        
        scrollView.addSubview(contentView)
        contentView.addSubviews(profileView)
    }
    
    private func layout() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(25)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
        }
    }
}

