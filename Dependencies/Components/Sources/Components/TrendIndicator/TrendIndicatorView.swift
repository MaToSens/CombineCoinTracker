//
//  TrendIndicatorView.swift
//
//
//  Created by MaTooSens on 10/03/2024.
//

import CoinInterface
import Utilities
import SwiftUI

public struct TrendIndicatorView: View {
    public enum DisplayMode {
        case text
        case background
    }
    
    private let displayMode: DisplayMode
    private let coin: CoinModel
    private let priceChangePercentage24String: String
    private let priceChangeColor: Color
    
    public init(coin: CoinModel, displayMode: DisplayMode = .text) {
        self.coin = coin
        self.displayMode = displayMode
        self.priceChangePercentage24String = coin.priceChangePercentage24HInCurrency?.asPercentString(digits: 2) ?? "N/A"
        self.priceChangeColor = coin.priceChangePercentage24H ?? 0 >= 0 ? .green : .red
    }
    
    public var body: some View {
        switch displayMode {
        case .text: buildTextView()
        case .background: buildBackgroundView()
        }
    }
    
    private func buildTextView() -> some View {
        Text(priceChangePercentage24String)
            .font(.footnote.weight(.medium))
            .foregroundStyle(priceChangeColor)
    }
    
    private func buildBackgroundView() -> some View {
        Text(priceChangePercentage24String)
            .foregroundColor(.white)
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(priceChangeColor)
            )
    }
}
