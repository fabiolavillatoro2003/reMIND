//
//  AddReMINDerView.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/28/23.
//

import SwiftUI

struct AddReMINDerView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var quote = ""
    @State private var importance: Double = 3.0
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    TextField("ReMINDer Name", text: $name)
                    TextField("ReMINDer", text: $quote)
                    VStack {
                        Text("Importance: \(Int(importance))")
                        Slider(value: $importance, in: 1...5, step: 1)
                    }
                    HStack{
                        Spacer()
                        Button("Submit") {
                            DataController().addReMINDer(importance: importance, name: name, quote: quote, context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct AddReMINDerView_Previews: PreviewProvider {
    static var previews: some View {
        AddReMINDerView()
    }
}
