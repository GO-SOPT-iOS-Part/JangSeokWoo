//
//  SignInViewModel.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation

enum AuthError: Error {
    case invalidEmail
    case invlidPassword
    case invalidUser
}

protocol SignInViewModelInput {
    func emailTextFieldDidChangeEvent(_ text: String)
    func passwordTextFieldDidChangeEvent(_ text: String)
    func signInButtonDidTapEvent()
}

protocol SignInViewModelOutput {
    var ableToSignIn: Observable<Bool> { get }
    var isSuccessLogin: Observable<Result<Bool,AuthError>> { get }
}

protocol SignInViewModel: SignInViewModelInput, SignInViewModelOutput { }

final class DefaultSignInViewModel: SignInViewModel {
    
    private var email: String
    private var password: String
    
    //MARK: - Output
    
    var ableToSignIn: Observable<Bool> = Observable(false)
    var isSuccessLogin: Observable<Result<Bool,AuthError>> = Observable(.failure(.invalidEmail))
    
    //MARK: - Init
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}

extension DefaultSignInViewModel {
    
    func emailTextFieldDidChangeEvent(_ text: String) {
        self.email = text
        self.ableToSignIn.value = email.hasText && password.hasText
    }
    
    func passwordTextFieldDidChangeEvent(_ text: String) {
        self.password = text
        self.ableToSignIn.value = email.hasText && password.hasText
    }
    
    func signInButtonDidTapEvent() {
        let isValidEmail = email.isEmailFormat
        let isValidPassword = password.isMoreThan(8)
        let isExistedUser = true //    나중에 서버 통신 후 해당 값 isExistedUser에 대입. 임시적으로 true
        
        guard isValidEmail else {
            isSuccessLogin.value = .failure(.invalidEmail)
            return
        }
        guard isValidPassword else {
            isSuccessLogin.value = .failure(.invlidPassword)
            return
        }
        guard isExistedUser else {
            isSuccessLogin.value = .failure(.invalidUser)
            return
        }
        
        isSuccessLogin.value = .success(true)
    }
}
