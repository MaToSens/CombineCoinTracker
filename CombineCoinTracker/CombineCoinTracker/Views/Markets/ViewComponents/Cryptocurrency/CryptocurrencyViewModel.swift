//
//  CryptocurrencyViewModel.swift
//  CombineCoinTracker
//
//  Created by MaTooSens on 12/03/2024.
//

import Components
import CoinInterface
import Combine
import DependencyInjection
import Foundation

final class CryptocurrencyViewModel: ObservableObject {
    enum State {
        case loading
        case loaded([CoinModel])
        case error(Error)
    }
    
    enum Event {
        case fetchCoins
        case loadingIndicatorIsAppeared
        
        case endpointButtonTapped(SelectedEndpointButtonOption)
        case timeframeEndpointButtonTapped(TimeframeEndpoint)
        case sortedEndpointButtonTapped(OrderEndpoint)
        case viewTapped
    }
    
    enum SelectedEndpointButtonOption {
        case timeframe
        case sorted
    }
    
    enum TimeframeEndpoint: String, SelectableEndpoint {
        static let title: String = "Timeframe"
        
        case hour = "1H"
        case day = "24H"
        case week = "7D"
        
        var value: String { self.rawValue.lowercased() }
    }
    
    enum OrderEndpoint: String, SelectableEndpoint {
        static let title: String = "Sorted By"
        
        case rankAsc = "Rank ↑"
        case marketCapAsc = "Market Cap ↑"
        case rankDesc = "Rank ↓"
        case marketCapDesc  = "Market Cap ↓"
        
        var value: String {
            switch self {
            case .rankAsc: "id_asc"
            case .marketCapAsc: "market_cap_asc"
            case .rankDesc: "id_desc"
            case .marketCapDesc: "market_cap_desc"
            }
        }
    }
    
    @Inject private var coinManager: CoinManagerInterface

    @Published private(set) var state: State = .loading
    @Published private(set) var currentPage: Int = 1
    @Published private(set) var showLoadingIndicator: Bool = true
    
    @Published private(set) var selectedButton: SelectedEndpointButtonOption?
    @Published private(set) var selectedTimeframe: TimeframeEndpoint = .day
    @Published private(set) var selectedOrder: OrderEndpoint = .marketCapDesc
 
    private var cancellables = Set<AnyCancellable>()
    
    init() { fetchCoins() }
    
    func trigger(_ event: Event) {
        switch event {
        case .fetchCoins:
            fetchCoins()
            
        case .loadingIndicatorIsAppeared:
            self.currentPage += 1
            fetchCoins()
            
        case .endpointButtonTapped(let option):
            switch option {
            case .timeframe: self.selectedButton = .timeframe
            case .sorted:  self.selectedButton = .sorted
            }
            
        case .timeframeEndpointButtonTapped(let timeframe):
            self.selectedTimeframe = timeframe
            fetchCoins()
            self.selectedButton = nil
            
        case .sortedEndpointButtonTapped(let sorted):
            self.selectedOrder = sorted
            fetchCoins()
            self.selectedButton = nil
            
        case .viewTapped:
            guard selectedButton != nil else { return }
            self.selectedButton = nil
        }
    }
    
    private func fetchCoins() {
        coinManager
            .fetchCoins(
                order: selectedOrder.value,
                page: currentPage,
                priceChangePercentage: selectedTimeframe.value
            )
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: handleCompletion, receiveValue: handleNewCoins)
            .store(in: &cancellables)
    }
    
    private func handleCompletion(completion: Subscribers.Completion<CoinError>) {
        switch completion {
        case .finished: ()
        case .failure(let error):
            switch error {
            case .noMoreData:
                self.showLoadingIndicator = false
            default:
                self.state = .error(error)
            }
        }
    }

    private func handleNewCoins(newCoins: [CoinModel]) {
        if case .loaded(let existingCoins) = self.state {
            let updatedCoins = existingCoins + newCoins
            self.state = .loaded(updatedCoins)
        } else {
            self.state = .loaded(newCoins)
        }
    }
}
