//
//  LoginUserApp.swift
//  LoginUser
//
//  Created by Abraham Sánchez Juárez on 09/09/22.
//

import SwiftUI

@main
struct LoginUserApp: App {
    var body: some Scene {
        WindowGroup {
            let login = PostViewModel()
            ContentView().environmentObject(login)
        }
    }
}
