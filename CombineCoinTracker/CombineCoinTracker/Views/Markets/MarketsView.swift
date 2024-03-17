//
//  MarketsView.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 12/03/2024.
//

import Components
import CoinInterface
import Design
import SwiftUI

struct MarketsView: View {
    @StateObject private var viewModel = MarketsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 15) {
                CategoryListView(viewModel.selectedCategory) { category in
                    viewModel.trigger(.categoryButtonTapped(category))
                }
                
                Divider()
                
                switch viewModel.selectedCategory {
                case .cryptocurrency:
                    CryptocurrencyView()
                case .nft:
                    Text("NTF")
                case .categories:
                    Text("Categories")
                case .exchanges:
                    Text("Exchanges")
                }
            }
            .padding()
        }
    }
}

#Preview {
    MarketsView()
}

