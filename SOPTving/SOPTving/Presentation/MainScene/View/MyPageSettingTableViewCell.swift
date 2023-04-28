//
//  MyPageSettingTableViewCell.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/29.
//

import UIKit

final class MyPageSettingTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    
    //MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tvingLightGray
        label.font = .tvingMedium(ofSize: 16)
        return label
    }()
    
    private let rightImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.contentMode = .scaleAspectFit
        view.tintColor = .tvingLightGray
        return view
    }()
    
    //MARK: - Life Cycle


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        hierarchy()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    func dataBind(_ text: String) {
        titleLabel.text = text
    }
}

extension MyPageSettingTableViewCell {
    
    func setUI() {
        contentView.backgroundColor = .black
    }
    
    func hierarchy() {
        contentView.addSubviews(titleLabel, rightImageView)
    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        rightImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
            $0.size.equalTo(20)
        }
    }
    
}
