//
//  CoinListView.swift
//
//
//  Created by MaTooSens on 10/03/2024.
//

import CoinInterface
import SwiftUI

public struct CoinListView: View {
    private let coins: [CoinModel]
    private let showLoadingIndicator: Bool
    private let action: () -> Void
    
    public init(
        _ coins: [CoinModel],
        showLoadingIndicator: Bool,
        action: @escaping () -> Void
    ) {
        self.coins = coins
        self.showLoadingIndicator = showLoadingIndicator
        self.action = action
    }
    
    public var body: some View {
        ScrollView {
            ForEach(coins) { coin in
                CoinRowView(coin)
                    .listRowInsets(
                        .init(top: 10, leading: 0, bottom: 10, trailing: 10)
                    )
            }
            
            if showLoadingIndicator {
                LazyVStack {
                    ProgressView()
                        .onAppear(perform: action)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
