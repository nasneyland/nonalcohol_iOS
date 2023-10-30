//
//  UserRepository.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/17.
//

import Foundation
import Combine

// 구현하기 전 미리 결과값을 반환하는 User Interface를 구현
public protocol UserRepository {
    func checkUserInfo() -> AnyPublisher<Bool, Error>
    func fetchUserInfo() -> AnyPublisher<UserEntity, Never>
    func saveUserNickname(user: UserEntity)
    func saveUserResolution(resolution: String)
    func deleteUserInfo()
}
