//
//  ContentView.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/27/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ReMINDer.date, ascending: false)]) var reminder: FetchedResults<ReMINDer>
    
    @State private var showingAddView = false
    
    //gets an array of fetched results, in reverse order so most recent first
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                List {
                    ForEach(reminder) { reminder in
                        NavigationLink(destination: EditReMINDerView(reminder: reminder)) {
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(reminder.quote ?? "")
                                        .bold()
                                    
                                }
                                Spacer()
                                Text(calcTimeSince(date: reminder.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                                
                            }
                        }
                    }
                    .onDelete(perform: deleteReMINDer)
                }
                .listStyle(.plain)
            }
            .navigationTitle("My ReMINDers")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add ReMINDer", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView){
                AddReMINDerView()
            }
            
        }
        .navigationViewStyle(.stack)
    }
    private func deleteReMINDer(offsets: IndexSet) {
        withAnimation {
            offsets.map{ reminder[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
