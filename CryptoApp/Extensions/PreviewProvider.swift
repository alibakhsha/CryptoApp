//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/24/1404 AP.
//

import Foundation
import SwiftUI


extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()    
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image:"<https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400>",
        currentPrice: 70187,
        marketCap: 1381651251183,
        marketCapRank: 1,
        fullyDilutedValuation: 1474623675796,
        totalVolume: 20154184933,
        high24H: 70215,
        low24H: 68060,
        priceChange24H: 2126.88,
        priceChangePercentage24H: 3.12502,
        marketCapChange24H: 44287678051,
        marketCapChangePercentage24H: 3.31157,
        circulatingSupply: 19675987,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 73738,
        athChangePercentage: -4.77063,
        athDate: "2024-03-14T07:10:36.635Z",
        atl: 67.81,
        atlChangePercentage: 103455.83335,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2024-04-07T16:49:31.736Z",
        sparklineIn7D: SparklineIn7D(price: [
            54019.98,
            54022.54,
            54017.32,
            54021,
            54019,
            54024,
            54026,
            54023
        ]),
        priceChangePercentage24HInCurrency: 3952.64,
        currentHoldings: 1.5
    )
}
