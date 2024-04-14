//
//  SignupVM.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 14/04/2024.
//

import SwiftUI
import Combine

class SignUpVM: ObservableObject {
    @Published var nameError: String?
    @Published var userError: String?
    @Published var phoneError: String?
    @Published var accountTypeError: String?
    @Published var emailError: String?
    @Published var isValid: Bool = false
    @Published var request = SignUpRequest() {
        didSet {
            if oldValue.name != request.name {
                validateName()
            }
            
            if oldValue.username != request.username {
                validateUserName()
            }
            
            if oldValue.phone != request.phone {
                validatePhone()
            }
            
            if oldValue.accountType != request.accountType {
                validateAccountType()
            }
            
            if oldValue.email != request.email {
                validateEmail()
            }
        }
    }

    let emailRule = Rule(.isValidEmail, message: "Field should contain a valid email")
    let emptyRule = Rule(.isEmpty, message: "Field should not be empty")
    let phoneRule = Rule(.isValidPhoneNumber, message: "Enter a valid phone number")
    let letterRule = Rule(.isLettersOnly, message: "Only letters allowed")
    
    var output = PassthroughSubject<Output, Never>()
    var isValidOutput = PassthroughSubject<Bool, Never>()
    
    enum Output {
        case nameError(String?)
        case userError(String?)
        case phoneError(String?)
        case accountTypeError(String?)
        case emailError(String?)
    }
    
    func validateName() {
        output.send(.nameError(SimpleValidator(rules: [emptyRule, letterRule], value:  request.name).validate()))
    }
    
    func validateUserName() {
        output.send(.userError(SimpleValidator(rules: [emptyRule, letterRule], value:  request.username).validate()))
    }
    
    func validatePhone() {
        output.send(.phoneError(SimpleValidator(rules: [emptyRule, phoneRule], value:  request.phone).validate()))
    }
    
    func validateAccountType() {
        output.send(.accountTypeError(SimpleValidator(rules: [emptyRule], value:  request.accountType).validate()))
    }
    
    func validateEmail() {
        output.send(.emailError(SimpleValidator(rules: [emptyRule, emailRule], value:  request.email).validate()))
    }
    
    func validateRequest() {
        validateName()
        validateEmail()
        validatePhone()
        validateUserName()
        validateAccountType()
        isValidOutput.send(nameError.isNilOrEmpty && userError.isNilOrEmpty && phoneError.isNilOrEmpty)
    }
}

