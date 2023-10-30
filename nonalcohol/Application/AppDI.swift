//
//  AppDI.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import Foundation
import Combine

public final class AppDI: AppDIInterface {
    
    static let shared = AppDI()
    
    public var userUseCase: UserUseCase
    
    public init() {
        let repository = UserRepositoryImp()
        let useCase = UserUseCaseImp(userRepository: repository)
        self.userUseCase = useCase
    }
    
    // MARK: - DI
    
    // 로그인VM 주입
    public func loginDependencies() -> LoginViewModel {
        let repository = UserRepositoryImp()
        let useCase = UserUseCaseImp(userRepository: repository)
        let viewModel = LoginViewModel(userUseCase: useCase)
        return viewModel
    }
    
    // 홈VM 주입
    public func homeDependencies() -> HomeViewModel {
        let userRepository = UserRepositoryImp()
        let userUseCase = UserUseCaseImp(userRepository: userRepository)
        let alcoholDataSource = AlcoholDataSource()
        let alcoholRepository = AlcoholRepositoryImp(alcoholDataSource: alcoholDataSource)
        let alcoholUseCase = AlcoholUseCaseImp(alcoholRepository: alcoholRepository)
        let viewModel = HomeViewModel(userUseCase: userUseCase, alcoholUseCase: alcoholUseCase)
        return viewModel
    }
    
    // 셋팅VM 주입
    public func settingDependencies() -> SettingViewModel {
        let repository = UserRepositoryImp()
        let useCase = UserUseCaseImp(userRepository: repository)
        let viewModel = SettingViewModel(userUseCase: useCase)
        return viewModel
    }
    
    // 캘린더VM 주입
    public func calendarDependencies() -> CalendarViewModel {
        let dataSource = AlcoholDataSource()
        let repository = AlcoholRepositoryImp(alcoholDataSource: dataSource)
        let useCase = AlcoholUseCaseImp(alcoholRepository: repository)
        let viewModel = CalendarViewModel(alcoholUseCase: useCase)
        return viewModel
    }
    
    // 데이터복구VM 주입
    public func restoreDependencies() -> RestoreViewModel {
        let userRepository = UserRepositoryImp()
        let userUseCase = UserUseCaseImp(userRepository: userRepository)
        let alcoholDataSource = AlcoholDataSource()
        let alcoholRepository = AlcoholRepositoryImp(alcoholDataSource: alcoholDataSource)
        let alcoholUseCase = AlcoholUseCaseImp(alcoholRepository: alcoholRepository)
        let viewModel = RestoreViewModel(userUseCase: userUseCase, alcoholUseCase: alcoholUseCase)
        return viewModel
    }
}
