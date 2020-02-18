//
//  ContentView.swift
//  HomeWork7
//
//  Created by Pavel Antonov on 13.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    
    typealias Field = (String, Color?)
    
    var pbl = PassthroughSubject<Void, Never>()
    var cancellable = Set<AnyCancellable>()
    
    @Published var phone: Field = ("", nil)
    @Published var email: Field = ("", nil)
    @Published var fio: Field = ("", nil)
    @Published var birthDate: Field = ("", nil)
    @Published var password: Field = ("", nil)
    
    init() {
        pbl.sink {
            self.phone.1 = self.phone.0.isValidPhone() ? .green : .red
            self.email.1 = self.email.0.isValidEmail() ? .green : .red
            self.fio.1 = self.fio.0.isValidName() ? .green : .red
            self.birthDate.1 = self.birthDate.0.isValidBirthDate() ? .green : .red
            self.password.1 = self.password.0.isValidPassword() ? .green : .red
        }.store(in: &cancellable)
    }
}

struct ContentView: View {

    @EnvironmentObject var vm: ContentViewModel

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("required").font(.subheadline).foregroundColor(.gray)
                TextField("Phone (+XX....XX)", text: $vm.phone.0)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(vm.phone.1)
            }
            .padding()
            VStack {
                TextField("Email", text: $vm.email.0)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(vm.email.1)
            }
            .padding()
            VStack(alignment: .leading) {
                Text("required").font(.subheadline).foregroundColor(.gray)
                TextField("ФИО", text: $vm.fio.0)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(vm.fio.1)
            }
            .padding()
            VStack(alignment: .leading) {
            Text("required").font(.subheadline).foregroundColor(.gray)
                TextField("Birth date (dd-mm-yyyy)", text: $vm.birthDate.0)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(vm.birthDate.1)
            }
            .padding()
            VStack {
                SecureField("Password (difficult pass)", text: $vm.password.0)
                Rectangle().frame(height: 2.0, alignment: .bottom).foregroundColor(vm.password.1)
            }
            .padding()
            Button(action: {
                self.vm.pbl.send()
            }) {
                Text("Submit")
            }
        }
    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentViewModel())
    }
}
