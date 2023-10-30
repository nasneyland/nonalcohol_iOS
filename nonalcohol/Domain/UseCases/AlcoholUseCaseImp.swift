//
//  AlcoholUseCaseImp.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import Foundation
import Combine

class AlcoholUseCaseImp: AlcoholUseCase {
    let alcoholRepository: AlcoholRepository
    
    init(alcoholRepository: AlcoholRepository) {
        self.alcoholRepository = alcoholRepository
    }
}

// Alcohol 관련 UseCase 구현부
extension AlcoholUseCaseImp {
    func getAlcohol(date: String) -> AnyPublisher<AlcoholEntity?, Never> {
        alcoholRepository.getAlcohol(date: date)
    }
    
    func updateAlcoholState(id: String, state: Bool) {
        alcoholRepository.updateAlcoholData(id: id, state: state)
    }
    
    func insertAlcohol(alcohol: AlcoholEntity) {
        alcoholRepository.setAlcoholData(alcohol: alcohol)
    }
    
    func deleteAlcohol(id: String) {
        alcoholRepository.deleteAlcoholData(id: id)
    }
    
    func getLastAlcoholDate() -> AnyPublisher<String?, Never> {
        alcoholRepository.getLastAlcoholDate()
    }
}
