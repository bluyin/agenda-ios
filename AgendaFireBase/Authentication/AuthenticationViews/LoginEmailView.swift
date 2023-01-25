//
//  LoginEmailView.swift
//  AgendaFireBase
//
//  Created by Bluyin  on 17/1/23.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 8)
            Group{
                Text("Hola de nuevo! 🤘🏻")
                    .bold()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group{
                Text("Loguéate:")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                
                HStack {
                    Image(systemName: "person")
                    TextField("Añade tu email", text: $textFieldEmail)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                HStack{
                    Image(systemName: "lock")
                    SecureField("Añade tu contraseña", text: $textFieldPassword)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
               
                
                Button("Login"){
                    authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError{
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 64)
                Spacer()
            }
        }
    }
    struct LoginEmailView_Previews: PreviewProvider {
        static var previews: some View {
            LoginEmailView(authenticationViewModel: AuthenticationViewModel())
        }
    }

