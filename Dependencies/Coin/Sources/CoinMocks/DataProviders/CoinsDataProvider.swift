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
            .tryMap { (coins: [CoinModel]) -> [CoinModel] in
                guard page <= 2 else {
                    throw CoinError.noMoreData
                }
                
                let startIndex = (page - 1) * perPage
                let endIndex = min(startIndex + perPage, coins.count)
                let slicedCoins = Array(coins[startIndex..<endIndex])
                
                return slicedCoins
            }
            .mapError { $0 as? CoinError ?? .invalidDecoding($0)}
            .eraseToAnyPublisher()
    }
}
