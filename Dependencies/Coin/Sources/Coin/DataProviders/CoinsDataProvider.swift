//
//  CoinsDataProvider.swift
//
//
//  Created by MaTooSens on 09/03/2024.
//

import BackendInterface
import CoinInterface
import Combine
import DependencyInjection
import Foundation

fileprivate struct Endpoint: EndpointInterface {
    let components: [String]
    let parameters: [String : Any]
    static let base: String = "/coins"
    
    init(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) {
        self.components = ["markets"]
        self.parameters = [
            "vs_currency": vsCurrency,
            "order": order,
            "per_page": perPage,
            "page": page,
            "sparkline": sparkline,
            "price_change_percentage" : priceChangePercentage,
            "locale": locale
        ]
    }
}

final class CoinsDataProvider: CoinsDataProviderInterface {
    @Inject private var backendManager: BackendManagerInterface
    
    func fetchCoins(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) -> AnyPublisher<[CoinModel], CoinError> {
        let endpoint = Endpoint(
            vsCurrency: vsCurrency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline,
            priceChangePercentage: priceChangePercentage,
            locale: locale
        )
        
        return backendManager
            .fetchObjects(endpoint: endpoint)
            .mapError(mapErrors)
            .eraseToAnyPublisher()
    }
    
    private func mapErrors(_ error: HTTPError) -> CoinError {
        switch error {
        case .invalidURL: return CoinError.invalidURL
        case .networkError(let error): return CoinError.networkError(error)
        case .invalidResponse: return CoinError.invalidResponse
        case .invalidStatusCode(let statusCode): return CoinError.invalidStatusCode(statusCode)
        case .invalidDecoding(let error): return CoinError.invalidDecoding(error)
        case .invalidParameters: return CoinError.invalidParameters
        }
    }
}
