//
//  AlcoholUseCase.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import Foundation
import Combine

// Alcohol UseCase 정의서
public protocol AlcoholUseCase {
    func getAlcoholData() -> AnyPublisher<[AlcoholEntity], Never>
    func setAlcoholData(alcohol: AlcoholEntity)
    func deleteAlcoholData(id: String)
}
