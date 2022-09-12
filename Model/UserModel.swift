//
//  UserModel.swift
//  LoginUser
//
//  Created by Abraham Sánchez Juárez on 09/09/22.
//

import Foundation

struct UserModel : Decodable {
    var data : [UserList]
}

struct User : Decodable{
    var data : UserList
}

struct UserList : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}
