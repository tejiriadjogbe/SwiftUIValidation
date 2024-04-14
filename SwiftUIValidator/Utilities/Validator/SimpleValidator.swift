//
//  SimpleValidator.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 15/01/2024.
//

public class SimpleValidator {
    let rules: [Rule]
    let value: String
    
    init(rules: [Rule], value: String) {
        self.rules = rules
        self.value = value
    }
    
    public func validate() -> String? {
        if let failedRule = rules.first(where: { !$0.validate(value) }) {
            return failedRule.message
        }
        return nil
    }
}

