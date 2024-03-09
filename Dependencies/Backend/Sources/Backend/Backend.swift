//
//  Backend.swift
//
//
//  Created by MaTooSens on 08/03/2024.
//

import BackendInterface
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
        Assemblies.inject(type: BackendManagerInterface.self, object: BackendManager())
    }
}
