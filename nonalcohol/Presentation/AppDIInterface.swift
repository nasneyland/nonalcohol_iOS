//
//  AppDIInterface.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/20.
//

import Foundation

public protocol AppDIInterface {
    
    var userUseCase: UserUseCase { get }
    
    func loginDependencies() -> LoginViewModel
    func homeDependencies() -> HomeViewModel
    func settingDependencies() -> SettingViewModel
    func calendarDependencies() -> CalendarViewModel
}
