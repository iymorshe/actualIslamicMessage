//
//  DataController.swift
//  IslamicMessage
//
//  Created by Iman Morshed on 1/2/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "IslamicMessage")
    init() {
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
