//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/23/1404 AP.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
