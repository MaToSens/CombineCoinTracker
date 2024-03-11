//
//  SectionHeaderView.swift
//
//
//  Created by MaTooSens on 10/03/2024.
//

import SwiftUI

public struct SectionHeaderView<Label: View>: View {
    private let title: String
    private let action: () -> Void
    private let label: Label
    
    public init(
        title: String,
        action: @escaping () -> Void,
        label: () -> Label
    ) {
        self.title = title
        self.action = action
        self.label = label()
    }
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.headline.weight(.semibold))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: action) {
                label
            }
            .font(.subheadline.weight(.medium))
            .foregroundStyle(.primary)
        }
    }
}

public extension SectionHeaderView where Label == Text {
    init(
        title: String,
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self.init(
            title: title,
            action: action,
            label: { Text(buttonTitle) }
        )
    }
}

public extension SectionHeaderView where Label == Image {
    init(
        title: String,
        systemName: String,
        action: @escaping () -> Void
    ) {
        self.init(
            title: title,
            action: action,
            label: { Image(systemName: systemName) }
        )
    }
}
