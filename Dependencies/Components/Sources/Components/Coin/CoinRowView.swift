//
//  File.swift
//  
//
//  Created by MaTooSens on 10/03/2024.
//

import CoinInterface
import SwiftUI

public struct CoinRowView: View {
    private let coin: CoinModel
    
    public init(_ coin: CoinModel) {
        self.coin = coin
    }
    
    public var body: some View {
        HStack {
            buildCoinInfoColumn()
            
            buildCoinPriceColumn()
        }
        .font(.callout)
        .fontWeight(.semibold)
        .foregroundStyle(.black)
        .monospacedDigit()
    }
    
    private func buildCoinInfoColumn() -> some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .padding(.horizontal, 15)
            
            AsyncImage(url: URL(string: coin.image)) { imagePhase in
                if let image = imagePhase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
            
            VStack(alignment: .leading) {
                Text(coin.name)
                
                Text(coin.symbol.uppercased())
                    .font(.footnote.weight(.medium))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func buildCoinPriceColumn() -> some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPriceString)
            
            TrendIndicatorView(coin: coin)
        }
    }
}
