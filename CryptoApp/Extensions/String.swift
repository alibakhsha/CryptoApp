//
//  String.swift
//  CryptoApp
//
//  Created by ali bakhsha on 6/22/1404 AP.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression,range: nil)
    }
    
}
