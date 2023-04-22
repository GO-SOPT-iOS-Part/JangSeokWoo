//
//  FirstViewController_Week3.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/22.
//

import UIKit

import SnapKit

final class CarrotViewController: BaseViewController {
    
    private let tableView = UITableView()
    
    private let dummy = Carrot.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setStyle() {
        
        view.backgroundColor = .white
        
        tableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.className)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension CarrotViewController: UITableViewDelegate {}

extension CarrotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.className, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}
