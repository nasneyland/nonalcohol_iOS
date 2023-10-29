//
//  UserUseCase.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/12.
//

import Foundation
import Combine

// User UseCase 정의서
public protocol UserUseCase {
    func checkUserInfo() -> AnyPublisher<Bool, Error>
    func fetchUserInfo() -> AnyPublisher<UserEntity, Error>
    func saveUserNickname(user: UserEntity)
    func deleteUserInfo()
}
