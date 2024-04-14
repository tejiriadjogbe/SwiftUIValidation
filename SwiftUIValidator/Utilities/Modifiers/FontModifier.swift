//
//  FontModifier.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 05/03/2024.
//

import SwiftUI

struct AppFont: ViewModifier {
    var style: FontStyles
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(style.rawValue, size: size))
    }
}
