//
//  CoreDataStack.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.06.2022..
//

import Foundation
import CoreData

class CoreDataStack{
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "MovieData")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror)")
            }
        }
    }
}
