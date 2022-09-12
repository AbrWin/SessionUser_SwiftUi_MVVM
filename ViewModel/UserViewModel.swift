//
//  UserViewModel.swift
//  LoginUser
//
//  Created by Abraham Sánchez Juárez on 09/09/22.
//

import Foundation
class UserViewModel: ObservableObject{
    @Published var dataModel =  UserModel(data: [])
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2")else{return}
        URLSession.shared.dataTask(with: url){data,_,_ in
            guard let data = data else {return}
            
            do{
                let json = try JSONDecoder().decode(UserModel.self, from: data)
                DispatchQueue.main.async {
                    self.dataModel = json
                }
            }catch let error as NSError{
                print("Json error\(error.description)")
            }
        }.resume()
    }
}
