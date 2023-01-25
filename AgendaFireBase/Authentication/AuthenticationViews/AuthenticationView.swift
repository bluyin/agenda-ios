
import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("agenda")
                .resizable()
                .frame(width: 200,height: 200)
            VStack {
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Entra con Email", systemImage: "envelope.fill")
                }
                .tint(.black)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top,60)
            Spacer()
            HStack {
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("¿No tienes cuenta?")
                    Text("Regístrate")
                        .underline()
                }
                .tint(.blue)
            }
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case.register:
                RegisterEmailView(AuthenticationViewModel: authenticationViewModel)
            case.login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            AuthenticationView(authenticationViewModel: AuthenticationViewModel())
        }
    }
}
