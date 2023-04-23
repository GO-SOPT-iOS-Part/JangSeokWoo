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
    
    var mainTitle: String? {
        didSet {
            updateUI()
        }
    }
    
    private var data: [String] = ["처음", "중간", "마지막"]
    
    private var currentNode : Node<String>? {
        didSet{ mainTitle = currentNode?.data }
    }
    private var dataLinkedList = LinkedList<String>()
    
    //MARK: - UI Components
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingSemiBold(ofSize: 20)
        label.text = "asdf"
        label.textColor = .white
        return label
    }()
    
    private lazy var prevButton = ButtonBuilder()
                                    .setTitle("이전으로",
                                             color: .white,
                                             font: .tvingSemiBold(ofSize: 16))
                                    .setBackgroundColor(.systemBlue)
                                    .setCornerRadius(12)
                                    .setAction { [weak self] _ in
                                        self?.prevButtonDidTap()
                                    }
                                    .build()
    
    private lazy var nextButton = ButtonBuilder()
                                    .setTitle("다음으로",
                                             color: .white,
                                             font: .tvingSemiBold(ofSize: 16))
                                    .setBackgroundColor(.systemBlue)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setData()
    }
    
}

//MARK: - Methods

extension MainVC {
    
    private func updateUI() {
        profileLabel.text = mainTitle
    }

    
    //MARK: Public
    
    private func setData() {
        dataLinkedList.append(data: data)
        currentNode = dataLinkedList.getHead()
    }
    
}

//MARK: - Action Method

extension MainVC {
    func nextButtonDidTap() {
        currentNode = currentNode?.next
    }
    
    func prevButtonDidTap() {
        currentNode = currentNode?.prev
    }
}





//MARK: - UI & Layout

extension MainVC {
    
    private func style() {
        view.backgroundColor = .black
    }
    
    private func hierarchy() {
        view.addSubviews(profileLabel, prevButton, nextButton)
    }
    
    private func layout() {
        profileLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(50)
            $0.top.equalTo(profileLabel.snp.bottom).offset(100)
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
        
        prevButton.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-50)
            $0.top.equalTo(profileLabel.snp.bottom).offset(100)
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
        
    }
}

