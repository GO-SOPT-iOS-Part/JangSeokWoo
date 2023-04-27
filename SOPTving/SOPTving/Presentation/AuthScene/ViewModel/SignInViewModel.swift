//
//  SignInViewModel.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation

protocol SignInViewModelInput {
    func idTextFieldDidChangeEvent(_ text: String)
    func passwordTextFieldDidChangeEvent(_ text: String)
}

protocol SignInViewModelOutput {
    var isValidEmail: Observable<Bool> { get }
    var isValidPassword: Observable<Bool> { get }
    var ableToLogin: Observable<Bool> { get }
}

protocol SignInViewModel: SignInViewModelInput, SignInViewModelOutput { }

final class DefaultSignInViewModel: SignInViewModel {
    
    private var email: String
    private var password: String
    
    //MARK: - Output
    
    var isValidEmail: Observable<Bool> = Observable(false)
    var isValidPassword: Observable<Bool> = Observable(false)
    var ableToLogin: Observable<Bool> = Observable(false)
    
    //MARK: - Init
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}

extension DefaultSignInViewModel {
    
    func idTextFieldDidChangeEvent(_ text: String) {
        self.isValidEmail.value = text.isEmailFormat && text.isMoreThan(8)
        self.ableToLogin.value = isValidEmail.value && isValidPassword.value
    }
    
    func passwordTextFieldDidChangeEvent(_ text: String) {
        self.isValidPassword.value = text.isMoreThan(8)
        self.ableToLogin.value = isValidEmail.value && isValidPassword.value
    }
    
}
