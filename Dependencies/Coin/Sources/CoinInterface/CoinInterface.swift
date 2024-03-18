//
//  CoinInterface.swift
//  
//
//  Created by MaTooSens on 08/03/2024.
//

import Combine
import Foundation

public protocol CoinManagerInterface {
    func fetchCoins(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) -> AnyPublisher<[CoinModel], CoinError>
}

public extension CoinManagerInterface {
    public func fetchCoins(
        vsCurrency: String = "usd",
        order: String,
        perPage: Int = 50,
        page: Int,
        sparkline: Bool = false,
        priceChangePercentage: String,
        locale: String = "en"
    ) -> AnyPublisher<[CoinModel], CoinError> {
        fetchCoins(
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

public protocol CoinsDataProviderInterface {
    func fetchCoins(
        vsCurrency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        priceChangePercentage: String,
        locale: String
    ) -> AnyPublisher<[CoinModel], CoinError>
}

public enum CoinError: LocalizedError {
    // API
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidDecoding(Error)
    case invalidData
    case invalidParameters
    
    case unknown
    case noMoreData
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .networkError(let error): return "Network Error: \(error.localizedDescription)"
        case .invalidResponse: return "Invalid Response"
        case .invalidStatusCode(let statusCode): return "Invalid Status Code: \(statusCode)"
        case .invalidDecoding(let decodingError): return "Invalid Decoding: \(decodingError.localizedDescription)"
        case .invalidData: return "Invalid Data"
        case .invalidParameters: return "Invalid Parameters"
        case .unknown: return "Unknown Error"
        case .noMoreData: return "No more data"
        }
    }
}
