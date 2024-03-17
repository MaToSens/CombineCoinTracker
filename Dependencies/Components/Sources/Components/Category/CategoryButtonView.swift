//
//  CategoryButtonView.swift
//  
//
//  Created by MaTooSens on 12/03/2024.
//

import SwiftUI

struct CategoryButtonView: View {
    let namespace: Namespace.ID
    let category: MarketCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: buildLabel)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(content: buildBackground)
            .animation(.default, value: isSelected)
    }
    
    private func buildLabel() -> some View {
        Text(category.rawValue)
            .font(.footnote.weight(.semibold))
            .fixedSize()
            .foregroundStyle(isSelected ? .white : .secondary)
           
    }
    
    private func buildBackground() -> some View {
        ZStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .matchedGeometryEffect(
                        id: "category_background",
                        in: namespace
                    )
            }
        }
    }
}
