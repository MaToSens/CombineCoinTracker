//
//  AssemblyShared.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 08/03/2024.
//

import DependencyInjection
import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Assemblies.setupDependencies()
        AssemblyShared.setupDependnecies()
    }
}

final class AssemblyShared {
    static func setupDependnecies() {
        // Inject here ..
    }
}
