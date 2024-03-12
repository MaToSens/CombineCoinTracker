//
//  ImageLoaderView.swift
//
//
//  Created by MaTooSens on 12/03/2024.
//

import SwiftUI
import Kingfisher

public struct ImageView: View {
    private let url: URL?
    
    public init(_ urlString: String) {
        self.url = URL(string: urlString)
    }
    
    public var body: some View {
        KFImage(url)
            .retry(maxCount: 3, interval: .seconds(5))
            .placeholder { ProgressView() }
            .onFailureImage(.init(systemName: "exclamationmark.triangle"))
            .cancelOnDisappear(true)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
