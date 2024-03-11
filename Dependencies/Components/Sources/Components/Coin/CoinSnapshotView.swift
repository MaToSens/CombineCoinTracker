//
//  CoinSnapshotView.swift
//  
//
//  Created by MaTooSens on 10/03/2024.
//

import CoinInterface
import SwiftUI

public struct CoinSnapshotView: View {
    private let coin: CoinModel
    
    public init(_ coin: CoinModel) {
        self.coin = coin
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: coin.image)) { imagePhase in
                if let image = imagePhase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
            
            buildCoinInfo()
            buildPortofolioCoinAmoutInfo()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
        )
    }
    
    @ViewBuilder
    private func buildCoinInfo() -> some View {
        Text(coin.name)
    
        Text(coin.currentPriceString)
            .fontWeight(.heavy)
        
    }
    
    private func buildPortofolioCoinAmoutInfo() -> some View {
        HStack {
            Text("0.235 \(coin.symbol.uppercased())")
                .foregroundStyle(.secondary)
            
            TrendIndicatorView(coin: coin, displayMode: .background)
        }
        .font(.footnote)
    }
}
