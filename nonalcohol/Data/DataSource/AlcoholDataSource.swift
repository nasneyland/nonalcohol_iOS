//
//  AlcoholDataSource.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/17.
//

import Foundation
import Combine
import CoreData

public final class AlcoholDataSource {
    
    let context = CoreDataManager.shared.context
    
    var alcoholData: NSEntityDescription? {
        return  NSEntityDescription.entity(forEntityName: "Alcohol", in: context)
    }
    
    func saveData() {
        CoreDataManager.shared.saveToContext()
    }
    
    // MARK: - Create
    
    func insertAlcohol(_ alcohol: AlcoholDTO) {
        if let entity = alcoholData {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(alcohol.date, forKey: "date")
            managedObject.setValue(alcohol.id, forKey: "id")
            managedObject.setValue(alcohol.state, forKey: "state")
            saveData()
        }
    }
    
    // MARK: - Read
    
    func fetchAlcohols() -> [Alcohol] {
        do {
            let request = Alcohol.fetchRequest()
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    /// 해당 날짜의 알코올 정보 가져오기
    func getAlcohol(date: String) -> AnyPublisher<AlcoholDTO?, Never> {
        let alcohols = fetchAlcohols()
        let alcohol = alcohols.filter { alcohol in
                                            alcohol.date == date
                                        }.first
        if let alcohol = alcohol {
            let alcoholDTO = AlcoholDTO(id: alcohol.id!, date: alcohol.date!, state: alcohol.state)
            
            return Just(alcoholDTO)
                .eraseToAnyPublisher()
        } else {
            return Just(nil)
                .eraseToAnyPublisher()
        }
    }
    
    /// 마지막으로 술 마신 날짜 구하기
    func getLastAlcoholDate() -> AnyPublisher<String?, Never> {
        let alcohols = fetchAlcohols()
        
        if let lastAlcohol = alcohols.filter({ $0.state }).sorted(by: { $0.date! < $1.date! }).first {
                return Just(lastAlcohol.date)
                    .eraseToAnyPublisher()
        } else {
            return Just(nil)
                .eraseToAnyPublisher()
        }
    }
    
    // MARK: - Update
    
    func updateAlcohol(_ id: String, state: Bool) {
        let fetchResults = fetchAlcohols()
        if let managedObject = fetchResults.filter({ $0.id == id }).first {
            managedObject.setValue(state, forKey: "state")
            saveData()
        }
    }
    
    // MARK: - Delete
    
    func deleteAlcohol(_ id: String) {
        let fetchResults = fetchAlcohols()
        let alcohol = fetchResults.filter({ $0.id == id })[0]
        context.delete(alcohol)
        saveData()
    }
}
