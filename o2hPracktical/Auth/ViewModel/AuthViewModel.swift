//
//  AuthViewModel.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

enum AuthState {
    case unknown
    case authenticated
    case unauthenticated
}

@MainActor
@Observable
final class AuthViewModel {
    
    
    var currentUser: User?
    var authState: AuthState = .unknown
    
    
    func signIn() async {
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = scene.windows.first?.rootViewController else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
            guard let idToken = result.user.idToken?.tokenString else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result.user.accessToken.tokenString)
            let authResult = try await Auth.auth().signIn(with: credential)
            self.currentUser = authResult.user
            self.authState = .authenticated
        } catch let error {
            print(error.localizedDescription)
            self.authState = .unauthenticated
        }
    }
    
    func checkLoggedIn() {
        self.authState = self.currentUser != nil ? .authenticated : .unauthenticated
    }
    
    func signOut()  {
        try? Auth.auth().signOut()
        GIDSignIn.sharedInstance.signOut()
        self.currentUser = nil
        self.authState = .unauthenticated
    }
}
