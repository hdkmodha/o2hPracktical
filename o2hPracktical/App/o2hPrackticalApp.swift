//
//  o2hPrackticalApp.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 04/05/26.
//

import Firebase
import SwiftUI

@main
struct o2hPrackticalApp: App {
    
    @State private var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authViewModel)
        }
    }
}
