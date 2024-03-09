//
//  CoinManager.swift
//
//
//  Created by MaTooSens on 09/03/2024.
//

import Combine
import CoinInterface
import DependencyInjection
import Foundation

final class CoinManager: CoinManagerInterface {
    @Inject private var coinsDataProvider: CoinsDataProviderInterface
    
    func fetchCoins(perPage: Int, page: Int) -> AnyPublisher<[Coin], CoinError> {
        coinsDataProvider
            .fetchCoins(perPage: perPage, page: page)
    }
}
