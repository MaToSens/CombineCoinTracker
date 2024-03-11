//
//  HomeViewModel.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 09/03/2024.
//

import CoinInterface
import Combine
import DependencyInjection
import Foundation

final class HomeViewModel: ObservableObject {
    enum State {
        case loading
        case loaded([CoinModel])
        case error(Error)
    }
    
    @Inject private var coinManager: CoinManagerInterface
    @Published private(set) var state: State = .loading
    
    init() { fetchCoins() }
    
    func fetchCoins() {
        coinManager
            .fetchCoins(perPage: 3, page: 1)
            .receive(on: RunLoop.main)
            .map { State.loaded($0) }
            .catch { Just(.error($0)) }
            .assign(to: &$state)
    }
}
