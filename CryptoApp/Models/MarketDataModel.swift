//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/26/1404 AP.
//

import Foundation


// JSON Data
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 18199,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1340,
     "total_market_cap": {
       "btc": 34670828.396894544,
       "eth": 901993512.3645087,
       "ltc": 33821267777.42737,
       "bch": 6960191080.204442,
       "bnb": 4779015360.714898,
       "eos": 7952821968959.762,
       "xrp": 1313878664595.5723,
       "xlm": 9528404702945.104,
       "link": 163976629853.22275,
       "dot": 1006211893459.4122,
       "yfi": 714705261.6673205,
       "sol": 21213324972.05755,
       "usd": 4100098886219.1123,
       "aed": 15057613159639.691,
       "ars": 5315960803886979,
       "aud": 6267349655991.243,
       "bdt": 497974299848314.25,
       "bhd": 1543560127596.0234,
       "bmd": 4100098886219.1123,
       "brl": 22144019069636.5,
       "cad": 5666951675587.746,
       "chf": 3307111060932.134,
       "clp": 3952889796829069,
       "cny": 29447320210714.297,
       "czk": 85710107157078.83,
       "dkk": 26145305572697.734,
       "eur": 3505855154243.8306,
       "gbp": 3023781927597.7344,
       "gel": 11029266003929.414,
       "hkd": 32078763675889.727,
       "huf": 1384158262540513.5,
       "idr": 66433902253408290,
       "ils": 13839125272138.67,
       "inr": 358814003879136.4,
       "jpy": 602776037757502.9,
       "krw": 5694914349991761,
       "kwd": 1251858592335.9646,
       "lkr": 1233677630447374.5,
       "mmk": 8606107562173918,
       "mxn": 77389366477385.78,
       "myr": 17273716607641.125,
       "ngn": 6284303564885758,
       "nok": 41803050206313.31,
       "nzd": 6889187053470.78,
       "php": 231872900512547.3,
       "pkr": 1161507242941367,
       "pln": 14941617262049.668,
       "rub": 326858837684171.75,
       "sar": 15385621070537.225,
       "sek": 39192025233591.234,
       "sgd": 5236646297479.049,
       "thb": 132591092933084.53,
       "try": 167284030457640.97,
       "twd": 123136219800375.53,
       "uah": 168969203900668.12,
       "vef": 410542901477.1195,
       "vnd": 107713243569406200,
       "zar": 72223241880749.67,
       "xdr": 2857998529232.3506,
       "xag": 107869911607.42726,
       "xau": 1229414651.0328014,
       "bits": 34670828396894.543,
       "sats": 3467082839689454.5
     },
     "total_volume": {
       "btc": 795718.7524527247,
       "eth": 20701355.73811168,
       "ltc": 776220766.7537174,
       "bch": 159741050.88498348,
       "bnb": 109681606.0247663,
       "eos": 182522595167.81836,
       "xrp": 30154396078.978138,
       "xlm": 218683275066.23013,
       "link": 3763373572.864951,
       "dot": 23093237444.488995,
       "yfi": 16402964.840501392,
       "sol": 486860027.9436008,
       "usd": 94100017839.992,
       "aed": 345582315517.3707,
       "ars": 122004863873844.19,
       "aud": 143839875769.9442,
       "bdt": 11428843986442.258,
       "bhd": 35425739616.203964,
       "bmd": 94100017839.992,
       "brl": 508220081351.12103,
       "cad": 130060339657.54495,
       "chf": 75900415689.6127,
       "clp": 90721470560468.72,
       "cny": 675835738128.6068,
       "czk": 1967104412934.3293,
       "dkk": 600052288761.1693,
       "eur": 80461725854.37057,
       "gbp": 69397822156.81573,
       "gel": 253129047989.57858,
       "hkd": 736229129578.3138,
       "huf": 31767359962028.496,
       "idr": 1524702589061390.8,
       "ils": 317617201715.5928,
       "inr": 8235021911240.143,
       "jpy": 13834114122746.428,
       "krw": 130702101779213.72,
       "kwd": 28730993846.977726,
       "lkr": 28313728584470.32,
       "mmk": 197515937446143.25,
       "mxn": 1776137836729.85,
       "myr": 396443375159.8864,
       "ngn": 144228979343712.56,
       "nok": 959408023889.7795,
       "nzd": 158111460875.62878,
       "php": 5321638497105.106,
       "pkr": 26657369813548.836,
       "pln": 342920131912.65955,
       "rub": 7501629426699.616,
       "sar": 353110316944.5702,
       "sek": 899483250528.9152,
       "sgd": 120184542785.23776,
       "thb": 3043054462018.7783,
       "try": 3839280633771.6577,
       "twd": 2826058785779.561,
       "uah": 3877956493904.0376,
       "vef": 9422234786.318396,
       "vnd": 2472091142862954,
       "zar": 1657571814251.4595,
       "xdr": 65592982035.473495,
       "xag": 2475686779.354134,
       "xau": 28215890.34932162,
       "bits": 795718752452.7247,
       "sats": 79571875245272.47
     },
     "market_cap_percentage": {
       "btc": 57.419073634089976,
       "eth": 13.382340116051086,
       "xrp": 4.521570611104649,
       "usdt": 4.065494188804965,
       "bnb": 2.913469727553931,
       "sol": 2.5451876045258897,
       "usdc": 1.6622933994751579,
       "steth": 0.9764694109621034,
       "ada": 0.8644790117751924,
       "doge": 0.8576677304718793
     },
     "market_cap_change_percentage_24h_usd": 1.0920591912433206,
     "updated_at": 1755441305
   }
 }
 
 */


struct GlobbalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap:  String {
//        if let item = totalMarketCap.first(where: { (key,value) -> Bool in
//            return key == "usd"
//        }) {
//            return "\(item.value)"
//        }
//        
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        
        return ""
    }
    
}
