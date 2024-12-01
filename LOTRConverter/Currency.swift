//
//  Currency.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
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
    func convert(amountString: String, currency: Currency) -> String {
        guard let amount = Double(amountString) else {
            return "NaN"
        }
        
        let convertedAmount = (amount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}
