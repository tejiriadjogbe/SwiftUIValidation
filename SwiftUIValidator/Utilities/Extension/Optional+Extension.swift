//
//  Optional+Extension.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 13/04/2024.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        if let unwrappedString = self {
            return unwrappedString.isEmpty || unwrappedString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        return true // Treat nil as empty
    }
}
