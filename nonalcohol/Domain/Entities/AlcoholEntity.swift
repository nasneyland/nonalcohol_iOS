//
//  AlcoholEntity.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/17.
//

import Foundation

public struct AlcoholEntity: Identifiable {
    public let id: String
    public var date: String
    public var state: Bool
}

public enum AlcoholState {
    case NonAlcohol
    case AlcoholLv1
    case AlcoholLv2
    case AlcoholLv3
    case AlcoholLv4
    case AlcoholLv5
    case MaxAlcohol
}

public enum NonalcoholSuccessState {
    case none
    case success
    case fail
}
