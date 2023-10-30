//
//  RestoreViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 10/30/23.
//

import Foundation
import Combine

public protocol RestoreViewModelInput {
    func restoreData()
}

public protocol RestoreViewModelOutput {
    var data: String { get }
}

public final class RestoreViewModel: ObservableObject, RestoreViewModelOutput {
    
    private var userUseCase: UserUseCase
    private var alcoholUseCase: AlcoholUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(userUseCase: UserUseCase, alcoholUseCase: AlcoholUseCase) {
        self.userUseCase = userUseCase
        self.alcoholUseCase = alcoholUseCase
    }
    
    @Published public var data: String = ""
}

extension RestoreViewModel: RestoreViewModelInput {
    public func restoreData() {
        // TODO: 데이터 복구하는 프로세스 추가하기
//        userUseCase.restoreData()
//        alcoholUseCase.restoreData()
    }
}
