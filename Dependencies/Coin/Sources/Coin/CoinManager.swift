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
    
    func fetchCoins(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) -> AnyPublisher<[CoinModel], CoinError> {
        coinsDataProvider
            .fetchCoins(
                vsCurrency: vsCurrency,
                order: order,
                perPage: perPage,
                page: page,
                sparkline: sparkline,
                priceChangePercentage: priceChangePercentage,
                locale: locale
            )
    }
}
