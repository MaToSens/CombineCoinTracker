//
//  Color+Extension.swift
//
//
//  Created by MaTooSens on 11/03/2024.
//

import SwiftUI

public extension Color {
    init(
        red: Double,
        green: Double,
        blue: Double,
        opacity: Double = 1
    ) {
        self.init(
            .sRGB,
            red: red/255,
            green: green/255,
            blue: blue/255,
            opacity: opacity
        )
    }
    
    static let backgroundColor = Color(red: 249, green: 259, blue: 251)
}
