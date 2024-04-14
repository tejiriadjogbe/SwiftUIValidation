//
//  ErrorBorder.swift
//  SwiftUIValidator
//
//  Created by Adjogbe  Tejiri on 14/04/2024.
//

import SwiftUI

struct ErrorBorder: View {
    var size: CGSize
    var hasError: Bool
    var body: some View {
        Rectangle()
            .trim(from: hasError ? 0 : 1, to: hasError ? 1 : 0)
            .fill(.red)
            .frame(width: size.width, height: size.height)
            .mask(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(style: .init(lineWidth: 2))
                    .foregroundStyle(.lightgrey)
                    .frame(width: size.width, height: size.height)
            )
            .clipShape(
                Rectangle()
            )
    }
}
