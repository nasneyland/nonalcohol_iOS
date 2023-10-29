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
    func getAlcoholData() -> AnyPublisher<[AlcoholEntity], Never> {
        return dataSource.getAlcoholDateList()
            .map({ alcoholDTOList in
                
                var alcoholEntities = [AlcoholEntity]()
                for alcohol in alcoholDTOList {
                    alcoholEntities.append(alcohol.dto())
                }
                
                return alcoholEntities
            })
            .eraseToAnyPublisher()
    }
    
    func setAlcoholData(alcohol: AlcoholEntity) {
        let alcoholDTO = AlcoholDTO(id: alcohol.id, date: alcohol.date)
        dataSource.insertAlcohol(alcoholDTO)
    }
    
    func deleteAlcoholData(id: String) {
        dataSource.deleteAlcohol(id)
    }
}
