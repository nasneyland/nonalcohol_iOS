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
    func getAlcoholData() -> AnyPublisher<[AlcoholEntity], Never> {
        return alcoholRepository.getAlcoholData()
    }
    
    func setAlcoholData(alcohol: AlcoholEntity) {
        alcoholRepository.setAlcoholData(alcohol: alcohol)
    }
    
    func deleteAlcoholData(id: String) {
        alcoholRepository.deleteAlcoholData(id: id)
    }
}
