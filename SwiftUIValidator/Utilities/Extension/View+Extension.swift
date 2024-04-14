//
//  View+Extension.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 05/03/2024.
//

import SwiftUI

extension View {
    func appFont(_ style: FontStyles, size: CGFloat) -> some View {
        self.modifier(AppFont(style: style , size: size))
    }
    
    func size(_ size: @escaping (CGSize) -> Void) -> some View {
        self.modifier(SizeModifier(getSize: size))
    }
    
    
    func validationError(_ errorMessage: String?) -> some View {
        self.modifier(ErrorModifier(errorMessage: errorMessage))
    }
}
