//
//  UserEntity.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/16.
//

import Foundation

public struct UserEntity: Identifiable {
    public var id: String
    public var nickname: String
    public var resolution: String
    
    init() {
        self.id = UUID().uuidString
        self.nickname = ""
        self.resolution = ""
    }
    
    init(id: String, nickname: String, resolution: String) {
        self.id = id
        self.nickname = nickname
        self.resolution = resolution
    }
}
