//
//  AppTextField.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 25/03/2024.
//

import SwiftUI

struct AppTextField: View {
    @Binding var text: String
    let label: String
    let image: String?
    var hasError: Bool = false
    @State private var size: CGSize = .zero
    
    var body: some View {
        ZStack {
            HStack {
                TextField(text: $text) { Text(label) }
                    .appFont(.regular, size: 16)
                    .padding(.all, 18)
                    .onTapGesture {
                        withAnimation {
                            //hasError.toggle()
                        }
                        
                    }
                Spacer()
                if let image = image {
                    HStack(spacing: 0) {
                        Divider()
                            .frame(width: 1.5, height: 30)
                            .overlay(.lightgrey.darker(0.1))
                        Image(systemName: image)
                            .foregroundStyle( hasError ? .red : .lightgrey.darker())
                            .padding()
                    }
                }
            }
            .size { size = $0 }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(style: .init(lineWidth: 2))
                    .foregroundStyle(.lightgrey)
            }
            ErrorBorder(size: size, hasError: hasError)
        }
    }
    
}

#Preview {
    AppTextField(text: .constant("Hello"), label: "Enter Name", image: nil)
}
