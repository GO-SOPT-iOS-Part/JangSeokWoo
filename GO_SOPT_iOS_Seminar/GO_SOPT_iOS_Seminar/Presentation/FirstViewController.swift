//
//  FirstViewController.swift
//  GO_SOPT_iOS_Seminar
//
//  Created by 장석우 on 2023/04/01.
//

import Foundation
import UIKit

final class FirstViewController: UIViewController {
    
    //MARK: - Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("PRESENT", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(presentButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("PUSH", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(pushButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel,
         nameTextField,
         presentButton,
         pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}


private extension FirstViewController {
    
    func presentToSecondViewController() {
            
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
        
    func pushToSecondViewController() {
        
        // 1. TextField의 String? 타입을 String 타입으로 변환한다.
        //    만약 TextField 값이 nil이라면 함수 자체를 종료한다.
        //    단, UIKIt 설계상 TextField는 값이 없어도 nil값을 반환하지 않는다. 빈 문자열 ""을 반환한다.
        //    따라서 아래 guard 문은 항상 통과한다. (else문에 들어가지 않는 다는 뜻!)
        guard let name = nameTextField.text else { return }
        // -> 옵셔널만 벗기고 화면전환하면 오류는 발생하지 않는다. But 나는 빈 문자열일 시 화면전환을 막고 싶어 아래 코드를 작성한다.
        
        //  2.name 문자열이 빈문자열인지 값이 있는 문자열인지 isEmpty속성으로 분기 처리한다.
        if name.isEmpty {
            nameTextField.placeholder = "문자열을 입력해주세요!!"
        } else {
            let secondViewController = SecondViewController()
            secondViewController.dataBind(name: name)
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @objc
    func presentButtonDidTap() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonDidTap() {
        
        pushToSecondViewController()
    }
}
