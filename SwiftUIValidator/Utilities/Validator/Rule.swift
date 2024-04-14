//
//  Rule.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 20/01/2024.
//

import Foundation

public struct Rule {
    var rule: ValidatorRule
    var message: String
    
    public init(_ rule: ValidatorRule, message: String) {
        self.rule = rule
        self.message = message
    }
    
    public init(_ rule: SVRules, message: String) {
        self.rule = rule
        self.message = message
    }
    
    public func validate(_ value: String) -> Bool {
        return rule.validate(value)
    }
}
