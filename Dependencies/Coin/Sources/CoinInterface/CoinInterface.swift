//
//  CoinInterface.swift
//  
//
//  Created by MaTooSens on 08/03/2024.
//

import Combine
import Foundation

public protocol CoinManagerInterface {
    func fetchCoins(perPage: Int, page: Int) -> AnyPublisher<[CoinModel], CoinError>
}

public protocol CoinsDataProviderInterface {
    func fetchCoins(perPage: Int, page: Int) -> AnyPublisher<[CoinModel], CoinError>
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
        }
    }
}
