//
//  NewEvent.swift
//  AgendaFireBase
//
//  Created by Bluyin  on 24/1/23.
//

import SwiftUI

struct NewEvent: View {
    
    @State var textEvent: String = ""
    @State var date: Date = Date()
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            
            DismissView()
                .padding(.top, 8)
            Group{
                Text("Crea un evento")
                    .bold()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            
            Group {
                Text("Escribe el evento:")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                HStack {
                    Image(systemName: "square.grid.3x1.folder.badge.plus")
                    TextField("Evento", text: $textEvent)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                }
                HStack{
                    DatePicker(selection: $date, label: {
                        Image(systemName: "square.grid.3x1.folder.badge.plus")
                    })
                }
                Button ("Añadir evento"){
                    postRequest(name: textEvent, date: date)
                    showingAlert = true
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                .alert("Evento enviado", isPresented: $showingAlert){
                    Button("ok", role: .cancel) {}
                }
            }
            
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
        Spacer()
            
        }
    }
}

struct NewEvent_Previews: PreviewProvider {
    static var previews: some View {
        NewEvent()
    }
}
