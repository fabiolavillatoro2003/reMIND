//
//  reMINDApp.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/27/23.
//

import SwiftUI
import CoreData

@main
struct reMINDApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
