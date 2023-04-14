//
//  Dish+CoreDataProperties.swift
//  littlelemonApp
//
//  Created by prueba on 13/04/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

}

extension Dish : Identifiable {
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }

    static func exists(title: String, _ context: NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", title)
        request.predicate = predicate
        
        do {
            guard let result = try context.fetch(request) as? [Dish] else {
                return false
            }
            return result.count > 0
        } catch(let error) {
            print(error.localizedDescription)
            return false
        }
    }
    
}
