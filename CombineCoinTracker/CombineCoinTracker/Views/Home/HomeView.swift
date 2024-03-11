//
//  HomeView.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 09/03/2024.
//

import Design
import CoinInterface
import Components
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
        
    private func buildHomeView(_ coins: [CoinModel]) -> some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 15) {
                buildPortfolioBalanceSection()
                buildPorfolioSnapshotSection(coins)
                buildWatchListSection(coins)
            }
            .padding()
        }
    }
    
    // MARK: Sections
    private func buildPortfolioBalanceSection() -> some View {
        VStack {
            SectionHeaderView(title: "Portflio balance", buttonTitle: "USD") {
                // Action
            }
            
            Text("$0.00")
                .font(.headline.weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
        }
    }
    
    private func buildPorfolioSnapshotSection(_ coins: [CoinModel]) -> some View {
        VStack(spacing: 15) {
            SectionHeaderView(title: "Portflio", buttonTitle: "View all") {
                // Action
            }
            
            HStack {
                CoinSnapshotView(coins[0])
                CoinSnapshotView(coins[1])
            }
            
            Divider()
        }
    }
    
    private func buildWatchListSection(_ coins: [CoinModel]) -> some View {
        VStack(spacing: 15) {
            SectionHeaderView(title: "Watch list", systemName: "gear") {
                // Action
            }
                
            CoinListView(coins)
        }
    }
}

#Preview {
    HomeView()
}
