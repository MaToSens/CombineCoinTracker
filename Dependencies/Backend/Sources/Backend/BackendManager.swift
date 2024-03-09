//
//  BackendManager.swift
//  
//
//  Created by MaTooSens on 09/03/2024.
//

import BackendInterface
import Combine
import Foundation
import Utilities

final class BackendManager: BackendManagerInterface {
    func fetchObjects<
        Endpoint: EndpointInterface,
        Response: Decodable
    >(endpoint: Endpoint) -> AnyPublisher<[Response], HTTPError> {
        URLSession
            .downloadPublisher(endpoint: endpoint)
            .decode(
                type: [Response].self,
                decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
            )
            .mapError { $0 as? HTTPError ?? .invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}
