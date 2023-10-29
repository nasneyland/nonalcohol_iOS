//
//  AlcoholRepository.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import Foundation
import Combine

// 구현하기 전 미리 결과값을 반환하는 Alcohol Interface를 구현
public protocol AlcoholRepository {
    func getAlcoholData() -> AnyPublisher<[AlcoholEntity], Never>
    func setAlcoholData(alcohol: AlcoholEntity)
    func deleteAlcoholData(id: String)
}
