//
//  HapticManager.swift
//  CryptoApp
//
//  Created by ali bakhsha on 5/28/1404 AP.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
