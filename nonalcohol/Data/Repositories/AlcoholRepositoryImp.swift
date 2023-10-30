//
//  AlcoholRepositoryImp.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import Foundation
import Combine

class AlcoholRepositoryImp: AlcoholRepository {
    
    private let dataSource: AlcoholDataSource
    
    public init(alcoholDataSource: AlcoholDataSource) {
        self.dataSource = alcoholDataSource
    }
}

extension AlcoholRepositoryImp {
    func getAlcohol(date: String) -> AnyPublisher<AlcoholEntity?, Never> {
        return dataSource.getAlcohol(date: date)
            .map{ $0?.dto() }
            .eraseToAnyPublisher()
    }
    
    func updateAlcoholData(id: String, state: Bool) {
        dataSource.updateAlcohol(id, state: state)
    }
    
    func setAlcoholData(alcohol: AlcoholEntity) {
        let alcoholDTO = AlcoholDTO(id: alcohol.id, date: alcohol.date, state: alcohol.state)
        dataSource.insertAlcohol(alcoholDTO)
    }
    
    func deleteAlcoholData(id: String) {
        dataSource.deleteAlcohol(id)
    }
    
    func getLastAlcoholDate() -> AnyPublisher<String?, Never> {
        dataSource.getLastAlcoholDate()
    }
}
