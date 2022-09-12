//
//  HomeView.swift
//  ContactList
//
//  Created by Abraham Sánchez Juárez on 06/09/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var json = UserViewModel()
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        NavigationView{
            if json.dataModel.data.isEmpty {
                ProgressView()
            }else{
                List(json.dataModel.data, id:\.id){ item in
                NavigationLink(destination: DetailView(id: item.id)){
                    HStack{
                        Image(systemName: "persona.fill")
                            .data(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(item.first_name).font(.title)
                            Text(item.email).font(.subheadline)
                        }
                    }.navigationBarTitle("User List")
                }
            }
            
        }
    }
        
}
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
