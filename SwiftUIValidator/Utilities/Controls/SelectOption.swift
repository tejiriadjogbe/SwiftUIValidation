//
//  SelectOption.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 25/03/2024.
//

import SwiftUI

struct SelectOption: View {
    @State var options: [String]
    @Binding var selectedOption: String
    @State var prompt: String = "Select Option"
    @State private var optionList: [String] = []
    @State private var isSelectOpen: Bool = false
    var hasError: Bool = true
    @State private var size: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ForEach(optionList, id: \.self) { name in
                    HStack {
                        Text(name)
                            .appFont(.regular, size: 16)
                            .foregroundStyle(selectedOption == name ? .black : selectedOption != prompt ? .lightgrey.darker() : .lightgrey.darker(0.4))
                        Spacer()
                        isSelectOpen ? nil :
                        Image(systemName: "chevron.down")
                            .foregroundStyle( hasError ? .red : .lightgrey.darker(0.4))
                    }
                    .onTapGesture {
                        withAnimation(.smooth) {
                            isSelectOpen.toggle()
                            selectedOption = name
                            optionList = isSelectOpen ? options : options.filter { $0 == name }
                        }
                    }
                }
            }
            .onAppear {
                optionList.append( selectedOption.isEmpty ? prompt : selectedOption)
            }
            .padding(.all, 20)
            .background{
                GeometryReader { proxy in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: .init(lineWidth: 2))
                            .foregroundStyle(.lightgrey)
                            .onChange(of: proxy.size, perform: { value in
                                size = proxy.size
                            })
                        ErrorBorder(size: proxy.size, hasError: hasError)
                    }
                } 
            }
            
        }
    }
}

#Preview {
    SelectOption(options: ["Gina", "Rukky", "Biglo"], selectedOption: .constant("Biglo"))
}
