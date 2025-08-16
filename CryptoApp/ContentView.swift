//
//  ContentView.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/23/1404 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 40){
                Text("Accent color")
                    .foregroundStyle(Color.theme.accent)
                Text("Secondary Text color")
                    .foregroundStyle(Color.theme.secendaryText)
                Text("red color")
                    .foregroundStyle(Color.theme.red)
                Text("green color")
                    .foregroundStyle(Color.theme.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
