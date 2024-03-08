//
//  BackendInterface.swift
//
//
//  Created by MaTooSens on 08/03/2024.
//

import Combine
import Foundation

public protocol BackendManagerInterface { 
    func fetchObjects<Endpoint: EndpointInterface,Response: Decodable>(endpoint: Endpoint) -> AnyPublisher<[Response], HTTPError>
}

public protocol EndpointInterface {
    var components: [String] { get }
    var parameters: [String: Any] { get }
    static var base: String { get }
}

public enum HTTPError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidDecoding(Error)
    case invalidParameters
}
