//
//  ContentView.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var pwd: String = ""
    @State var username: String = ""
    @State var nameError: String = ""
    @State var validator: SimpleValidator?
    @StateObject var vm = SignUpVM()
    
    var body: some View {
        VStack {
            Text("SwiftUI Validation")
                .appFont(.light, size: 35)
                .padding(.top, 30)
            ScrollView {
                VStack(spacing: 20) {
                    AppTextField(text: $vm.request.name, label: "Enter Name", image: "person", hasError: !vm.nameError.isNilOrEmpty)
                        .validationError(vm.nameError)
                    AppTextField(text: $vm.request.email, label: "Enter Email", image: "envelope", hasError: !vm.emailError.isNilOrEmpty)
                        .validationError(vm.emailError)
                    AppTextField(text: $vm.request.username, label: "Enter Username", image: "at", hasError: !vm.userError.isNilOrEmpty)
                        .validationError(vm.userError)
                    AppTextField(text: $vm.request.phone, label: "Enter Phone Number", image: "key.horizontal", hasError: !vm.phoneError.isNilOrEmpty)
                        .validationError(vm.phoneError)
                    SelectOption(options: ["Free", "Premium", "Ultra"], selectedOption: $vm.request.accountType, prompt: "Select Account Type", hasError: !vm.accountTypeError.isNilOrEmpty)
                        .validationError(vm.accountTypeError)
                    Button {
                        vm.validateRequest()
                    } label: {
                        Text("CONTINUE")
                            .appFont(.bold, size: 15)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                    }
                    .background(.accent)
                    .cornerRadius(26)
                    .padding(.top, 40)
                }
                .onReceive(vm.output) { event in
                    withAnimation(.smooth(duration: 0.3)) {
                        switch event {
                        case .nameError(let error):
                            vm.nameError = error
                        case .userError(let error):
                            vm.userError = error
                        case .phoneError(let error):
                            vm.phoneError = error
                        case .accountTypeError(let error):
                            vm.accountTypeError = error
                        case .emailError(let error):
                            vm.emailError = error
                        }
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
            }
        }
       
    }
}

#Preview {
    ContentView()
}
