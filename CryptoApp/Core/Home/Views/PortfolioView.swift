//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/27/1404 AP.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject  private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading,spacing: 0) {
                    SearchBarView(searchText: $vm.seaerchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailinNavBarButtons
                }
            })
            .onChange(of: vm.seaerchText, perform: { value in
                if value == "" {
                    removeSelectedCoin()
                }
            })
//            .navigationBarItems(leading: XMarkButton()) // doplicate
        }
    }
}
#Preview {
    PortfolioView()
        .environmentObject(dev.homeVM)
}


extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.seaerchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                uppdateSelectedCoin(coin: coin)
                            }
                        }
                        .background (
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical,4)
            .padding(.leading)
        }
    }
    
    private func uppdateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0.0
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of  \(selectedCoin?.symbol.uppercased() ?? "") :")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Desimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
//                                    .lineLimit(1)
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Desimals())
            }
            
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var trailinNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(
                (selectedCoin != nil  && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0)

        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        // save  to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        //show chekmart
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        //hide keyboard
        UIApplication.shared.endEditing()
        
        //  hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
        
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.seaerchText = ""
    }
}
