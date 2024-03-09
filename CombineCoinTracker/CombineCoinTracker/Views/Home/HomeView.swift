//
//  HomeView.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 09/03/2024.
//

import CoinInterface
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .loaded(let coins):
            buildHomeView(coins)
        case .error(let error):
            Label("Error: \(error.localizedDescription)", systemImage: "questionmark")
        }
    }
    
    private func buildHomeView(_ coins: [Coin]) -> some View {
        ScrollView {
            VStack {
                ForEach(coins) { coin in
                    Text(coin.name)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
