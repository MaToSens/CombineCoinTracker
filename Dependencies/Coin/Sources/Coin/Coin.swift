//
//  Coin.swift
//
//
//  Created by MaTooSens on 08/03/2024.
//

import Backend
import CoinInterface
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
//        Assemblies.inject(type: CoinManagerInterface.self, object: CoinManager())
        Assemblies.inject(type: CoinsDataProviderInterface.self, object: CoinsDataProvider())
        
        injectShared()
    }
    
    public static func injectShared() {
        Assemblies.inject(type: CoinManagerInterface.self, object: CoinManager())
        
        Backend.Dependencies.inject()
    }
}
