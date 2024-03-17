//
//  ButtonStyle+Extension.swift
//
//
//  Created by MaTooSens on 13/03/2024.
//

import SwiftUI

public struct GreyButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(7)
            .background (
                RoundedRectangle(cornerRadius: 5)
                    .fill(.secondary.opacity(0.2))
            )
    }
}

public extension ButtonStyle where Self == GreyButtonStyle {
    static var grey: Self { Self() }
}
