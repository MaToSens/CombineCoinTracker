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
        vsCurrency: String = "usd",
        order: String = "market_cap_desc",
        perPage: Int,
        page: Int,
        sparkline: Bool = false,
        locale: String = "en"
    ) {
        self.components = ["markets"]
        self.parameters = [
            "vs_currency": vsCurrency,
            "order": order,
            "per_page": perPage,
            "page": page,
            "sparkline": sparkline,
            "locale": locale
        ]
    }
}

final class CoinsDataProvider: CoinsDataProviderInterface {
    @Inject private var backendManager: BackendManagerInterface
    
    func fetchCoins(perPage: Int, page: Int) -> AnyPublisher<[CoinModel], CoinError> {
        let endpoint: Endpoint = Endpoint(perPage: perPage, page: page)
        
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
