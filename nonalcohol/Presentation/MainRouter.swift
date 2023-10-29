//
//  MainRouter.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/20.
//

import Foundation
import Combine

public final class MainRouter: ObservableObject {
    
    public var appDI: AppDIInterface
    
    @Published public var isLogined = false
    
    private var bag = Set<AnyCancellable>()
    
    init(appDI: AppDIInterface) {
        self.appDI = appDI
    }
    
    // 로그인이 되어있는 상태인지 체크하는 로직
    public func checkLogined() {
        return appDI.userUseCase.checkUserInfo()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.isLogined = false
                }
            } receiveValue: { isLogined in
                self.isLogined = isLogined
            }
            .store(in: &bag)
    }
}
