//
//  AlcoholDTO.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/23.
//

import Foundation

public struct AlcoholDTO: Codable, Equatable {
    public var id: String
    public var date: String
    public var state: Bool
    
    // DTO: Data Transfer Object
    public func dto() -> AlcoholEntity {
        return AlcoholEntity(id: id, date: date, state: state)
    }
}
