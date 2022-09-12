//
//  LoginView.swift
//  ContactList
//
//  Created by Abraham Sánchez Juárez on 06/09/22.
//

import SwiftUI

struct LoginView: View {
    @State var user = ""
    @State var password = ""
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        
        VStack{
            ZStack{
                Image("concert")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                        .frame(height: 315, alignment: .top)
                    
                VStack{
                    Group {
                        Text("App demo for Movies")
                            .foregroundColor(CustomColor.greenBase)
                            .font(.system(size: 12))
                        Text("Welcome to \nthe Movie app").font(.system(size: 31)).bold()
                        Text("May be you can find great movies in this app").font(.system(size: 12))
                    }
                    .frame(width: UIScreen.main.bounds.width,alignment: .leading)
                    .padding([.leading], 22)
                    .foregroundColor(.white)
                }.frame(height: 300,alignment: .bottom)
            }.frame(height: 300)
            VStack{
                Rectangle()
                    .frame(height: 60)
                InputText(
                    value: self.$user,
                    placeHolder: "User"
                )
                InputText(
                    password: self.$password,
                    placeHolder: "Password"
                )
                Rectangle()
                    .frame(height: 15)
                Button(action: {
                    login.login(email: user, password: password)
                }){
                    Text("Hi there!").foregroundColor(.black)
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: 40)
                .background(CustomColor.greenBase)
                .cornerRadius(6)
            }
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .top
            )
        }.background(Color.black.opacity(0.99))
        .frame(height:UIScreen.main.bounds.height,alignment: .top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
