//
//  Color+Extension.swift
//  CardMan
//
//  Created by Adjogbe  Tejiri on 05/03/2024.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
    
    func lighter(_ factor: CGFloat = 0.2) -> Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        // Extract the components of the original color
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        // Calculate the lighter color by adding the factor to each component
        red += factor
        green += factor
        blue += factor

        // Ensure the components stay within the valid color range
        red = min(1.0, red)
        green = min(1.0, green)
        blue = min(1.0, blue)

        // Create and return the lighter color
        return Color(red: red, green: green, blue: blue, opacity: Double(alpha))
    }
    
    func darker(_ factor: CGFloat = 0.2) -> Color {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            // Extract the components of the original color
            UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            // Calculate the darker color by subtracting the factor from each component
            red -= factor
            green -= factor
            blue -= factor

            // Ensure the components stay within the valid color range
            red = max(0.0, red)
            green = max(0.0, green)
            blue = max(0.0, blue)

            // Create and return the darker color
            return Color(red: red, green: green, blue: blue, opacity: Double(alpha))
        }
}
