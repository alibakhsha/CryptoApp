//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/25/1404 AP.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
//    var cancellable = Set<AnyCancellable>()
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else{ return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobbalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
