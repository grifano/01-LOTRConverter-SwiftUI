//
//  Currency.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 21/06/2026.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case goldPiece = 1
    case goldPenny = 4
    case silverPiece = 16
    case silverPenny = 64
    case copperPenny = 6400
    
    var id: Currency {
        self
    }
    
    var image: ImageResource {
        switch self {
        case .goldPiece:
                .goldpiece
        case .goldPenny:
                .goldpenny
        case .silverPiece:
                .silverpiece
        case .silverPenny:
                .silverpenny
        case .copperPenny:
                .copperpenny
        }
    }
    
    var name: String {
        switch self {
        case .goldPiece:
            "Gold Piece"
        case .goldPenny:
            "Gold Penny"
        case .silverPiece:
            "Silver Piece"
        case .silverPenny:
            "Silver Penny"
        case .copperPenny:
            "Copper Penny"
        }
    }
    
    func convert(amountString: String, currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return "Numbers only!"
        }
        
        let convertedAmount = String((doubleAmount / self.rawValue) * currency.rawValue)
        
        return convertedAmount
    }
}
