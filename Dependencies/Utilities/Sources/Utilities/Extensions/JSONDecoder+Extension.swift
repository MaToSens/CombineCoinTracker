//
//  JSONDecoder+Extension.swift
//
//
//  Created by MaTooSens on 09/03/2024.
//

import Foundation

public extension JSONDecoder {
    convenience init(withKeyDecodingStrategy keyDecodingStrategy: KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
