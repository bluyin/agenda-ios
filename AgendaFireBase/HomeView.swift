//
//  HomeView.swift
//  AgendaFireBase
//
//  Created by Bluyin  on 18/1/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")")
                    .padding(.top, 32)
                
                Spacer()
                
                //Mostrar eventos
                NavigationLink (destination: ApiList(), label: {
                    Label("Mostrar eventos", systemImage: "calendar")
                })
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                
                //crear evento
                NavigationLink (destination: NewEvent(), label: {
                    Label("Crear evento", systemImage: "calendar.badge.plus")
                })
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button("Logout"){
                    authenticationViewModel.logout()
                }
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(authenticationViewModel: AuthenticationViewModel())
        }
    }
}
