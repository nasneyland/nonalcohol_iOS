//
//  LoginViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import Foundation
import Combine

public protocol LoginViewModelInput {
    func saveUserNickname()
}

public protocol LoginViewModelOutput {
    var user: UserEntity { get }
}

public final class LoginViewModel: ObservableObject, LoginViewModelOutput {
    
    private var userUseCase: UserUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(userUseCase: UserUseCase) {
        self.userUseCase = userUseCase
    }
    
    @Published public var user = UserEntity()
}

extension LoginViewModel: LoginViewModelInput {
    public func saveUserNickname() {
       userUseCase.saveUserNickname(user: user)
    }
}
