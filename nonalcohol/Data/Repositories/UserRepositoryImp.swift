//
//  UserRepositoryImp.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import Foundation
import Combine

class UserRepositoryImp: UserRepository {
    
    ///회원인지 확인 -> UserDefaults에 닉네임 정보가 있으면 회원, 없으면 비회원
    func checkUserInfo() -> AnyPublisher<Bool, Error> {
        let isUser = (UserDefaults.standard.string(forKey: UserDefaultKey.nickname) != nil)
        return Just(isUser)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    ///회원정보 불러오기
    func fetchUserInfo() -> AnyPublisher<UserEntity, Error> {
        let nickname = UserDefaults.standard.string(forKey: UserDefaultKey.nickname) ?? ""
        let resolution = UserDefaults.standard.string(forKey: UserDefaultKey.resolution) ?? ""
        return Just(UserEntity(id: UUID().uuidString, nickname: nickname, resolution: resolution))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    ///회원정보(닉네임) 저장하기
    func saveUserNickname(user: UserEntity) {
        UserDefaults.standard.set(user.nickname, forKey: UserDefaultKey.nickname)
    }
    
    ///회원정보 삭제하기
    func deleteUserInfo() {
        UserDefaults.standard.removeObject(forKey: UserDefaultKey.nickname)
    }
}
