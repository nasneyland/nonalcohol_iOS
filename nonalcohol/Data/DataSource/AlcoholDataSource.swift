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
    
    func getAlcoholDateList() -> AnyPublisher<[AlcoholDTO], Never> {
        var alcoholList: [AlcoholDTO] = []
        let fetchResults = fetchAlcohols()
        for result in fetchResults {
            let alcohol = AlcoholDTO(id: result.id ?? "", date: result.date ?? Date())
            alcoholList.append(alcohol)
        }
        return Just(alcoholList)
//            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Update
    
    // MARK: - Delete
    
    func deleteAlcohol(_ id: String) {
        let fetchResults = fetchAlcohols()
        let alcohol = fetchResults.filter({ $0.id == id })[0]
        context.delete(alcohol)
        saveData()
    }
    
    func deleteAllAlcohols() {
        let fetchResults = fetchAlcohols()
        for result in fetchResults {
            context.delete(result)
        }
        saveData()
    }
}
