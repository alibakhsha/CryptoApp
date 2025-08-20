//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/24/1404 AP.
//

import SwiftUI

let dev = DeveloperPreview.instance

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        .background(Color.theme.background.opacity(0.001))
    }
}

#Preview {
    CoinRowView(coin: dev.coin,showHoldingsColumn: true)
}


extension CoinRowView {
    private var leftColumn: some View {
        HStack (spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secendaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30,height: 30)
            VStack(alignment: .leading, spacing: 0) {
                Text("\(coin.symbol.uppercased())")
                    .font(.headline)
                    .padding(.leading,6)
                    .foregroundStyle(Color.theme.accent)
                
                Text("\(coin.name)")
                    .font(.caption)
                    .foregroundStyle(Color.theme.secendaryText)
                    .padding(.horizontal,6)
            }
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Desimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Desimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width/3,alignment: .trailing)
    }
}
