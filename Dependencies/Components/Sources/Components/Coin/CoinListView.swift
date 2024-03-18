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
    
    public init(_ coins: [CoinModel]) {
        self.coins = coins
    }
    
    public var body: some View {
        ScrollView {
            ForEach(coins) { coin in
                CoinRowView(coin)
                    .listRowInsets(
                        .init(top: 10, leading: 0, bottom: 10, trailing: 10)
                    )
            }
        }
        .scrollIndicators(.hidden)
        .clipShape(.rect(cornerRadius: 20))
    }
}
