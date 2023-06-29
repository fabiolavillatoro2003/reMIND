//
//  EditReMINDerView.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/29/23.
//

import SwiftUI
import CoreData

struct EditReMINDerView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var reminder: FetchedResults<ReMINDer>.Element
    
    @State private var name: String = ""
    @State private var quote: String = ""
    @State private var importance: Double = 3
    
    
    var body: some View {
        Form {
            Section {
                TextField("reminder.name" , text: $name)
                    .onAppear {
                        name = reminder.name!
                        quote = reminder.quote ?? ""
                        importance = reminder.importance
                    }
                TextField("reminder.name" , text: $name)
                    .onAppear {
                        quote = reminder.quote!
                        name = reminder.name ?? ""
                        importance = reminder.importance
                    }
                VStack {
                    Text("Importance: \(Int(importance))")
                    Slider(value: $importance, in: 1...5, step: 1)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit"){
                        DataController().editReMINDer(reminder: reminder, importance: importance, name: name, quote: quote, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

