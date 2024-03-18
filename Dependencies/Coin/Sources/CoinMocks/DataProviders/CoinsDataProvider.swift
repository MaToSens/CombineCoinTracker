//
//  SwiftUIView.swift
//  
//
//  Created by MaTooSens on 09/03/2024.
//

import CoinInterface
import Combine
import Foundation
import Utilities

final class CoinsDataProvider: CoinsDataProviderInterface {
    func fetchCoins(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) -> AnyPublisher<[CoinModel], CoinError> {
        Bundle
            .module
            .decodable(fileName: "Coins", withExtension: ".json")
            .mapError { CoinError.invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}
