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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
