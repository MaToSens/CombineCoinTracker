//
//  Double+Extension.swift
//
//
//  Created by MaTooSens on 10/03/2024.
//

import Foundation

public extension Double {
    func asPercentString(digits: Int = 1) -> String {
        asNumberString(digits: digits) + "%"
    }
    
    func asNumberString(digits: Int = 2) -> String {
        String(format: "%.\(digits)f", self)
    }
    
    func asCurrencyWithDecimals(_ digits: Int = 6) -> String {
        currencyFormatter(digits).string(from: NSNumber(value: self)) ?? "N/A"
    }
    
    private func currencyFormatter(_ digits: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = digits
        return formatter
    }
}
