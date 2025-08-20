//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/29/1404 AP.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    
    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink {[ weak self ] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overView
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistics(details: CoinDetailModel?,coin: CoinModel) -> (overView: [StatisticModel], additional: [StatisticModel]) {
        
        let overviewArray = createOverviewArray(coin: coin)
        let additionalArray = createAdditionalArray(details: details, coin: coin)

        return (overviewArray,additionalArray)
    }
    
    private func createOverviewArray(coin: CoinModel) -> [StatisticModel]{
        let price = coin.currentPrice.asCurrencyWith6Desimals()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
        let marketcapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketcapPercentChange)
        
        let rank = "\(coin.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" +  (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        let overviewArray: [StatisticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray
    }
    
    private func createAdditionalArray(details: CoinDetailModel?,coin: CoinModel) -> [StatisticModel] {
        let high = coin.high24H?.asCurrencyWith6Desimals() ?? "n/a"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coin.low24H?.asCurrencyWith6Desimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coin.priceChange24H?.asCurrencyWith6Desimals() ?? "n/a"
        let pricePercentChange = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        
        let marketCapChange = "$" + (coin.marketCapChange24H?.formattedWithAbbreviations() ?? "n/a")
        let marketcapPercentChange = coin.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketcapPercentChange)
        
        let blockTime = details?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockTimeStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = details?.hashingAlgorithm ??  "n/a"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        
        let additionalArray: [StatisticModel] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockTimeStat, hashingStat
        ]
        
        return additionalArray
    }
    
}
