//
//  ContentView.swift
//  LoginUser
//
//  Created by Abraham Sánchez Juárez on 09/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        Group{
            if login.authenticated == 0 {
                LoginView()
            }else if login.authenticated == 1 {
                HomeView()
            }else if login.authenticated == 2 {
                VStack{
                    Text("Usuario y/o contraseña incorrectos")
                    Button(action:{
                        login.authenticated = 0
                    }){
                        Text("Regresar")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
