//
//  EndpointButtonView.swift
//
//
//  Created by MaTooSens on 17/03/2024.
//

import SwiftUI

struct EndpointButtonView<Endpoint: SelectableEndpoint> : View {
    let endpoint: Endpoint
    let isSelected: Bool
    let isLast: Bool
    let action: () -> Void
    
    init(
        endpoint: Endpoint,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.endpoint = endpoint
        self.isSelected = isSelected
        self.isLast = (endpoint != Endpoint.allCases.last)
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: buildButtonLabel)
            .foregroundStyle(.secondary)
    }
    
    private func buildButtonLabel() -> some View {
        VStack {
            HStack {
                Text(endpoint.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "checkmark")
                    .opacity(isSelected ? 1 : 0)
            }
            
            Divider()
                .opacity(isLast ? 1 : 0)
        }
    }
}
