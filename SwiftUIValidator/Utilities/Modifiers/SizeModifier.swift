//
//  SizeModifier.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 13/03/2024.
//

import SwiftUI

struct SizeModifier: ViewModifier {
    var getSize: (CGSize) -> Void
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    getSize(proxy.size)
                }
            }        )
    }
}
