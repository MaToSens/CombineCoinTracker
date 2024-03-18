//
//  CategoryListView.swift
//
//
//  Created by MaTooSens on 12/03/2024.
//

import SwiftUI

public enum MarketCategory: String, CaseIterable {
    case cryptocurrency = "Cryptocurrency"
    case nft = "NFT"
    case categories = "Categories"
    case exchanges = "Exchanges"
}

public struct CategoryListView: View {
    @Namespace private var namespace
    
    private let selectedCategory: MarketCategory
    private let action: (MarketCategory) -> Void
    
    public init(
        _ selectedCategory: MarketCategory,
        action: @escaping (MarketCategory) -> Void
    ) {
        self.selectedCategory = selectedCategory
        self.action = action
    }
    
    public var body: some View {
        HStack {
            ForEach(MarketCategory.allCases, id: \.self) { category in
                CategoryButtonView(
                    namespace: namespace,
                    category: category,
                    isSelected: selectedCategory == category,
                    action: { action(category) }
                )
            }
        }
    }
}
