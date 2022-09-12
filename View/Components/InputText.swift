//
//  InputText.swift
//  ContactList
//
//  Created by Abraham Sánchez Juárez on 06/09/22.
//

import SwiftUI

struct InputText: View {
    
    
    var value: Binding<String>? = nil
    var password: Binding<String>? = nil
    
    var placeHolder: String
    
    var body: some View {
        
        HStack{
            Group{
                if let password = password {
                    CustomTextField(
                        placeholder: Text(placeHolder).foregroundColor(CustomColor.greenBase),
                        password: password
                    )
                }
                
                if let value = value {
                    SuperTextField(
                        placeholder: Text(placeHolder).foregroundColor(CustomColor.greenBase),
                        text: value
                    )
                }
            }
            .padding([.bottom], 12)
            .textFieldStyle(OvalTextFieldStyle())
        }
    }
}

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder.padding([.leading], 50)}
            TextField(
                "",
                text: $text,
                onEditingChanged: editingChanged,
                onCommit: commit
            )
            .foregroundColor(CustomColor.greenBase)
            .padding([.leading, .trailing], 34)
        }
    }
    
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var password : String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if password.isEmpty { placeholder.padding([.leading], 50) }
            SecureField("", text: $password) {
        
            }.foregroundColor(CustomColor.greenBase)
                .padding([.leading, .trailing], 34).onChange(of: password, perform: { text in
                    print(text)
                })
        }
    }
}
