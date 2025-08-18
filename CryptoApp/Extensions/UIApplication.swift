//
//  UIApplication.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/26/1404 AP.
//

import Foundation
import SwiftUI


extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
