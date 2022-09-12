//
//  PostViewModel.swift
//  ContactList
//
//  Created by Abraham Sánchez Juárez on 06/09/22.
//

import Foundation
class PostViewModel: ObservableObject{
    
    @Published var authenticated = 0
    
    init(){
        if let session = UserDefaults.standard.object(forKey: "sesion") as? Int{
            authenticated = session
        }else{
            authenticated = 0
        }
    }
    
    func login(email: String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login")else{return}
        let params = ["email": email, "password":password]
        let body = try!JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){data,responce,error in
            if let responce = responce {
                print(responce)
            }
            
            guard let data = data else {return}
            do{
                let dataResponce = try JSONDecoder().decode(PostModel.self, from: data)
                if !dataResponce.token.isEmpty{
                    DispatchQueue.main.async {
                        print("My token->\(dataResponce.token)")
                        self.authenticated = 1
                        //UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            }catch let error as NSError{
                print("Error->\(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }

        }.resume()
    }
}
