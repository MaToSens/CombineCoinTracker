//
//  AssemblyMocks.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 08/03/2024.
//

import CoinMocks
import DependencyInjection

extension Assemblies {
    static func setupDependencies() {
        CoinMocks.Dependencies.inject()
    }
}
