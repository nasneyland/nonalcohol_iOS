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
    func getAlcohol(date: String) -> AnyPublisher<AlcoholEntity?, Never>
    func updateAlcoholState(id: String, state: Bool)
    func insertAlcohol(alcohol: AlcoholEntity)
    func deleteAlcohol(id: String)
    func getLastAlcoholDate() -> AnyPublisher<String?, Never>
}
