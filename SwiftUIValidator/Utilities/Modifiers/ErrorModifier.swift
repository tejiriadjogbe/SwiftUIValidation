//
//  ErrorModifier.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 12/04/2024.
//

import SwiftUI

struct ErrorModifier: ViewModifier {
    var errorMessage: String?
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            content
            ErrorMessage(errorMessage)
        }
    }
}
