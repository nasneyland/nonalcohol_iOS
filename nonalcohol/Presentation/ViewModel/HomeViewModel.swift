//
//  HomeViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import Foundation
import Combine

public protocol HomeViewModelInput {
}

public protocol HomeViewModelOutput {
}

public final class HomeViewModel: ObservableObject, HomeViewModelOutput {

    private var userUseCase: UserUseCase
    private var alcoholUseCase: AlcoholUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(userUseCase: UserUseCase, alcoholUseCase: AlcoholUseCase) {
        self.userUseCase = userUseCase
        self.alcoholUseCase = alcoholUseCase
    }
    
    @Published public var alcoholList: [AlcoholEntity] = []
}

extension HomeViewModel: HomeViewModelInput {
    
    /// ViewDidLoad
    public func executeFetch() {
        getAlcoholData()
    }
    
    /// 음주 데이터 저장하기
    public func saveAlcoholData() {
        alcoholUseCase.setAlcoholData(alcohol: AlcoholEntity(id: UUID().uuidString, date: Date()))
    }
    
    /// 전체 음주 데이터 불러오기
    public func getAlcoholData() {
        alcoholUseCase.getAlcoholData()
            .assign(to: \.alcoholList, on: self)
            .store(in: &bag)
    }
    
    /// 특정 id의 음주 데이터 삭제하기
    public func deleteAlcoholData(id: String) {
        alcoholUseCase.deleteAlcoholData(id: id)
    }
}
