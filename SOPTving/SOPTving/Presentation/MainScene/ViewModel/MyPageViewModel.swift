//
//  MyPageViewModel.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation

protocol MyPageViewModelInPut {
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

protocol MyPageViewModelOutput {
    
}

protocol MyPageViewModel: MyPageViewModelInPut, MyPageViewModelOutput { }

final class DefaultMyPageViewModel: MyPageViewModel {

    //MARK: - Data
    
    private var profileData: MyProfile
    
    
    
    //MARK: - Output
    
    
    
    //MARK: - Init
    
    
    init(profileData: MyProfile) {
        self.profileData = profileData
    }
    
    //MARK: - Private
    
    
}

//MARK: - Input, Event

extension DefaultMyPageViewModel {
    func viewDidLoad() {
        print("viewDidload")
    }
    
    func didSelectRow(at indexPath: IndexPath){
        print(#function)
    }
    
}
