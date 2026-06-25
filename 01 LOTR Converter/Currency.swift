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
    case copperBit = 25600
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
        case .copperBit:
                .copperbit
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
        case .copperBit:
            "Copper Bit"
        case .copperPenny:
            "Copper Penny"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}
