//
//  MenuViewModel.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI
import CoreData

final class MenuViewModel: ObservableObject {
    
    @Published var flight_number: String = ""
    @Published var to: String = ""
    @Published var airport_to: String = ""
    @Published var departure_time: String = ""
    
    @Published var from: String = ""
    @Published var airport_from: String = ""
    @Published var arrival_time: String = ""
    @Published var flight_time: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var selectedFlight: MenuModel? = nil
    
    @Published var flights: [MenuModel] = []
    
    @AppStorage("completed_flights") var completed_flights: [String] = []
    
    func fetchFlights() {
        
        CoreDataStack.shared.modelName = "MenuModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MenuModel>(entityName: "MenuModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.flights = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.flights = []
        }
    }
    
    func addFlight(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MenuModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MenuModel", into: context) as! MenuModel
        
        trans.flight_number = flight_number
        trans.to = to
        trans.airport_to = airport_to
        trans.departure_time = departure_time
        trans.from = from
        trans.airport_from = airport_from
        trans.arrival_time = arrival_time
        trans.flight_time = flight_time
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
