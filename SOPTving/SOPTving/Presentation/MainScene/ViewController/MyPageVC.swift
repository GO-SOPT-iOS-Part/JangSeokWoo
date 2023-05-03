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
    
    private var myPageSettingData = MyPageSetting()
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
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(MyPageSettingTableViewCell.self,
                           forCellReuseIdentifier: MyPageSettingTableViewCell.className)
        return tableView
    }()
    
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.updateConstraints {
            $0.height.equalTo(tableView.contentSize.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods

extension MyPageVC {
    
    private func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bind() {
     
    }
    
    
    //MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
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
        contentView.addSubviews(profileView,tableView)
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
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(tableView.contentSize.height)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        
    }
}

//MARK: - UITableViewDelegate

extension MyPageVC: UITableViewDelegate {
    
}

extension MyPageVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return myPageSettingData.userSetting.count
        case 1:
            return myPageSettingData.appSetting.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageSettingTableViewCell.className, for: indexPath) as? MyPageSettingTableViewCell
        else { return UITableViewCell()}
        
        switch indexPath.section {
        case 0:
            cell.dataBind(myPageSettingData.userSetting[indexPath.row])
            
        case 1:
            cell.dataBind(myPageSettingData.appSetting[indexPath.row])
        default:
            fatalError("\(#function)에서 에러가 발생했습니다.")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}

extension MyPageVC {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return MyPageSettingFooterView(isLastSection: false).intrinsicContentSize.height
        case 1:
            return MyPageSettingFooterView(isLastSection: true).intrinsicContentSize.height
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            return MyPageSettingFooterView(isLastSection: false)
        case 1:
            return MyPageSettingFooterView(isLastSection: true)
        default:
            return nil
        }
    }
}
