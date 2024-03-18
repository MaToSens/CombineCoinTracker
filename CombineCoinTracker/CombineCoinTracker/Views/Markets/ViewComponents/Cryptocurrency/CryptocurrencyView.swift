//
//  CryptocurrencyView.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 12/03/2024.
//

import CoinInterface
import Components
import Design
import SwiftUI

struct CryptocurrencyView: View {
    @StateObject private var viewModel = CryptocurrencyViewModel()

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .loaded(let coins):
            buildCryptocurrencyView(coins)
        case .error(let error):
            Label("Error: \(error.localizedDescription)", systemImage: "questionmark")
        }
    }
    
    private func buildCryptocurrencyView(_ coins: [CoinModel]) -> some View {
        ZStack {
            VStack(spacing: 15) {
                buildEndpointButtons()
                
                CoinListView(coins, showLoadingIndicator: viewModel.showLoadingIndicator) {
                    viewModel.trigger(.loadingIndicatorIsAppeared)
                }
            }
            
            buildEndpointListView()
        }
        .onTapGesture { viewModel.trigger(.viewTapped) }
    }
    
    private func buildEndpointButtons() -> some View {
        HStack(spacing: 5) {
            Button("All Coins") {
                // action
            }
           
            Button(viewModel.selectedTimeframe.rawValue) {
                viewModel.trigger(.endpointButtonTapped(.timeframe))
            }
            
            Button(viewModel.selectedOrder.rawValue) {
                viewModel.trigger(.endpointButtonTapped(.sorted))
            }
        
            Spacer()
        }
        .buttonStyle(.grey)
        .font(.footnote.weight(.semibold))
        .foregroundStyle(.primary)
    }
    
    @ViewBuilder
    private func buildEndpointListView() -> some View {
        if let selectedButton = viewModel.selectedButton {
            switch selectedButton {
            case .timeframe:
                EndpointListView(viewModel.selectedTimeframe) { timeframe in
                    viewModel.trigger(.timeframeEndpointButtonTapped(timeframe))
                }
            case .sorted:
                EndpointListView(viewModel.selectedOrder) { sorted in
                    viewModel.trigger(.sortedEndpointButtonTapped(sorted))
                }
            }
        }
    }
}

#Preview {
    MarketsView()
}
