//
//  CoinRowView.swift
//  
//
//  Created by MaTooSens on 10/03/2024.
//

import CoinInterface
import SwiftUI

struct CoinRowView: View {
    private let coin: CoinModel
    private let marketCapRank: String
    
    init(_ coin: CoinModel) {
        self.coin = coin
        self.marketCapRank = String(coin.marketCapRank)
    }
    
    var body: some View {
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
            Text(marketCapRank)
                .frame(width: 35)
            
            ImageView(coin.image)
                .frame(width: 30, height: 30)
                
            
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
