//
//  ContentView.swift
//  HomeWork7
//
//  Created by Pavel Antonov on 13.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var phone: String = ""
    @State var phoneColor: Color? = .black
    @State var email: String = ""
    @State var emailColor: Color? = .black
    @State var fio: String = ""
    @State var fioColor: Color? = .black
    @State var birthDate: String = ""
    @State var birthDateColor: Color? = .black
    @State var password: String = ""
    @State var passwordColor: Color? = .black
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("required").font(.subheadline).foregroundColor(.red)
                TextField("Phone", text: $phone)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(phoneColor)
            }
            .padding()
            VStack {
                TextField("Email", text: $email)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(emailColor)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("required").font(.subheadline).foregroundColor(.red)
                TextField("ФИО", text: $fio)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(fioColor)
            }
            .padding()
            VStack(alignment: .leading) {
            Text("required").font(.subheadline).foregroundColor(.red)
                TextField("Birth date", text: $birthDate)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(birthDateColor)
            }
            .padding()
            VStack {
                TextField("Password", text: $password)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(passwordColor)
            }
            .padding()
            Button(action: {
                print("tuturu")
            }) {
                Text("Submit")
            }
        }
    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
