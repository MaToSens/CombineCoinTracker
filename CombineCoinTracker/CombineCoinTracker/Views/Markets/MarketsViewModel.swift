//
//  MarketsViewModel.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 12/03/2024.
//

import Components
import CoinInterface
import DependencyInjection
import Foundation

final class MarketsViewModel: ObservableObject {
    enum State {
        case loading
        case loaded
        case error
    }
    
    enum Event {
        case categoryButtonTapped(MarketCategory)
    }
    
    @Published private(set) var selectedCategory: MarketCategory = .cryptocurrency
    
    func trigger(_ event: Event) {
        switch event {
        case .categoryButtonTapped(let category):
            self.selectedCategory = category
        }
    }
}
