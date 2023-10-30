//
//  UserUseCaseImp.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import Foundation
import Combine

class UserUseCaseImp: UserUseCase {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}

// User 관련 UseCase 구현부
extension UserUseCaseImp {
    func checkUserInfo() -> AnyPublisher<Bool, Error> {
        userRepository.checkUserInfo()
    }
    
    func fetchUserInfo() -> AnyPublisher<UserEntity, Never> {
        userRepository.fetchUserInfo()
    }
    
    func saveUserNickname(user: UserEntity) {
        userRepository.saveUserNickname(user: user)
    }
    
    func saveUserResolution(resolution: String) {
        userRepository.saveUserResolution(resolution: resolution)
    }
    
    func deleteUserInfo() {
        userRepository.deleteUserInfo()
    }
}
