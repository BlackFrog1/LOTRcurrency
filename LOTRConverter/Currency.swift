//
//  Currency.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case cacobean    = 128
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny   = 4
    case goldPiece   = 1
    
    var image: ImageResource {
        switch self {
            case .cacobean:
                .cacaobean
            case .copperPenny:
                .copperpenny
            case .silverPenny:
                .silverpenny
            case .silverPiece:
                .silverpiece
            case .goldPenny:
                .goldpenny
            case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .cacobean:
            "Caco Bean"
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    var id: Currency { self }
    
//    func convert(from value: Double) -> Double {
//        value / Double(self.rawValue)
//    }
//    
//    func convert(to value: Double) -> Double {
//        value * Double(self.rawValue)
//    }
//    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let amount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (amount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
    
    

}


class UserDefaultsManager {
    
    @MainActor
    static private let defaults = UserDefaults.standard
        
    @MainActor
    static func save(_ currency: Currency, saveName: String) {
        defaults.set(currency.rawValue, forKey: saveName)
        defaults.synchronize()
    }
    
    @MainActor
    static func restore(_ saveName: String) -> Currency? {
        guard let rawValue = defaults.value(forKey: saveName) as? Double else {
            return nil
        }
        
        return Currency(rawValue: rawValue)
    }
}
