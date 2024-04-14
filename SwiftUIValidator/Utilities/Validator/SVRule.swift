//
//  SVRule.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 15/01/2024.
//

import Foundation

public protocol ValidatorRule {
    func validate(_ text: String) -> Bool
}

public enum SVRules: ValidatorRule {
    case isValidEmail
    case isValidPhoneNumber
    case isValidPassword
    case isEmpty
    case isDigit
    case hasSymbol
    case hasNumber
    case hasUpperCase
    case hasLowerCase
    case isEqualTo(Double)
    case isGreaterThan(Double)
    case isLessThan(Double)
    case isGreaterThanOrEqualTo(Double)
    case isLessThanOrEqualTo(Double)
    case isLettersOnly
    case custom(() -> Bool)
    case regex(String)
    
    public func validate(_ text: String) -> Bool {
        switch self {
        case .isValidEmail:
            return validateRegex("^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", value: text)
        case .isValidPhoneNumber:
            return validateRegex("^[+]?[0-9]{10,14}$", value: text)
        case .isValidPassword:
            return validateRegex("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$", value: text)
        case .isEmpty:
            return !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case .isDigit:
            return validateRegex("^[0-9]+$", value: text)
        case .hasSymbol:
            return validateRegex(".*[^a-zA-Z0-9\\s].*", value: text)
        case .hasNumber:
            return validateRegex(".*\\d+.*", value: text)
        case .hasUpperCase:
            return validateRegex(".*[A-Z]+.*", value: text)
        case .hasLowerCase:
            return validateRegex(".*[a-z]+.*", value: text)
        case .isLettersOnly:
            return validateRegex("^[a-zA-Z]*$", value: text)
        case .isEqualTo(let compareValue):
            return validateComparison(Double(text), compareValue: compareValue) { $0 == $1 }
        case .isGreaterThan(let compareValue):
            return validateComparison(Double(text), compareValue: compareValue) { $0 > $1 }
        case .isLessThan(let compareValue):
            return validateComparison(Double(text), compareValue: compareValue) { $0 < $1 }
        case .isGreaterThanOrEqualTo(let compareValue):
            return validateComparison(Double(text), compareValue: compareValue) { $0 >= $1 }
        case .isLessThanOrEqualTo(let compareValue):
            return validateComparison(Double(text), compareValue: compareValue) { $0 <= $1 }
        case .regex(let regex):
            return validateRegex(regex, value: text)
        case .custom(let customFunction):
            return customFunction()
        }
    }
    
    private func validateComparison<T: Comparable>(_ value: T?, compareValue: T, condition: (T, T) -> Bool) -> Bool {
        return value.map { condition($0, compareValue) } ?? false
    }
    
    private func validateRegex(_ regex: String, value: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: value)
    }
}
