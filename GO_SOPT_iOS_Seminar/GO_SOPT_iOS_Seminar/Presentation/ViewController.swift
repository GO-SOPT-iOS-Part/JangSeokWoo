//
//  ViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 김승찬 on 2023/01/16.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        return label
    }()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
}

private extension ViewController {
    
    //MARK: - Custom Method
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func layout() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
}
