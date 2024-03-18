//
//  EndpointListView.swift
//
//
//  Created by MaTooSens on 16/03/2024.
//

import SwiftUI

public protocol SelectableEndpoint: RawRepresentable, CaseIterable, Hashable where AllCases: RandomAccessCollection, RawValue == String {
    static var title: String { get }
    var value: String { get }
}

public struct EndpointListView<Endpoint: SelectableEndpoint>: View {
    private let selectedEndpoint: Endpoint
    private let action: (Endpoint) -> Void
    
    public init(_ selectedEndpoint: Endpoint, action: @escaping (Endpoint) -> Void) {
        self.selectedEndpoint = selectedEndpoint
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 15) {
            Text(Endpoint.title)
                .font(.callout)
                .fontWeight(.semibold)
            
            ForEach(Endpoint.allCases, id: \.self) { endpoint in
                EndpointButtonView(
                    endpoint: endpoint,
                    isSelected: selectedEndpoint == endpoint,
                    action: { action(endpoint) }
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
        )
        .offset(y: -20)
    }
}
