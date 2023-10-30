//
//  SettingViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/19.
//

import Foundation
import Combine

public protocol SettingViewModelInput {
    func deleteUserInfo()
}

public final class SettingViewModel: ObservableObject {
    
    private var userUseCase: UserUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(userUseCase: UserUseCase) {
        self.userUseCase = userUseCase
    }
    
    @Published var isAllowPush = false
}

extension SettingViewModel: SettingViewModelInput {

    public func deleteUserInfo() {
       userUseCase.deleteUserInfo()
    }
}
