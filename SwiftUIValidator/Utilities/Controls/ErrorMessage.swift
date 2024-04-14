//
//  ErrorMessage.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 13/04/2024.
//

import SwiftUI

struct ErrorMessage: View {
    var message: String?
    init(_ message: String?) {
        self.message = message
    }
    var body: some View {
        message.isNilOrEmpty ? nil :
        Text(message!)
            .appFont(.regular, size: 14)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.lightgrey)
            .foregroundStyle(.red)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    ErrorMessage("Error")
}
