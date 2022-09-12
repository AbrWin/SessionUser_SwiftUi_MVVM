//
//  DetailView.swift
//  LoginUser
//
//  Created by Abraham Sánchez Juárez on 09/09/22.
//

import SwiftUI

struct DetailView: View {
    var id : Int
    @StateObject var user = DetailViewModel()
    var body: some View {
        VStack{
            if user.avatar.isEmpty {
                ProgressView()
            }else{
                Image(systemName: "persona.fill")
                    .data(url: URL(string: user.avatar)!)
                    .frame(width: 130, height: 130)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name).font(.largeTitle)
                Text(user.email).font(.title)
            }
        }.onAppear{
            user.fetch(id: id)
        }
    }
}

