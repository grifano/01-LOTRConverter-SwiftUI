//
//  ExchangeRateView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 15/06/2026.
//

import SwiftUI

struct ExchangeRateView: View {
    let leftCurrencyIcon: ImageResource
    let rateNoteText: String
    let rightCurrencyIcon: ImageResource
    
    var body: some View {
        HStack {
            Image(leftCurrencyIcon)
                .resizable()
                .scaledToFit()
                .frame(height: 44)
            
            // Exchange rate
            Text(rateNoteText)

            // Right Currency Icon
            Image(rightCurrencyIcon)
                .resizable()
                .scaledToFit()
                .frame(height: 44)
        }
    }
}

