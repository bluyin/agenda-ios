
import Foundation

final class AuthenticationRepository {
    private let AuthenticationfirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(AuthenticationfirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.AuthenticationfirebaseDatasource = AuthenticationfirebaseDatasource
    }
    
    func getCurrentUser() -> User? {
        AuthenticationfirebaseDatasource.getCurrentUser()
    }
        
    
    func createNewUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>)-> Void){
        AuthenticationfirebaseDatasource.createNewUser(email: email,password: password,completionBlock: completionBlock )
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>)-> Void){
        AuthenticationfirebaseDatasource.login(email: email,password: password,completionBlock: completionBlock )
    }
    
    
    func logout() throws {
        try AuthenticationfirebaseDatasource.logout()
    }
}

