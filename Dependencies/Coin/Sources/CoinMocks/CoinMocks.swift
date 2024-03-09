//
//  CoinMocks.swift
//  
//
//  Created by MaTooSens on 08/03/2024.
//

import Coin
import CoinInterface
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
        Assemblies.inject(type: CoinsDataProviderInterface.self, object: CoinsDataProvider())

        Coin.Dependencies.injectShared()
    }
}
