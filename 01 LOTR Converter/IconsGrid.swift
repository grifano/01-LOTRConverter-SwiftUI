//
//  IconsGrid.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 15/06/2026.
//

import SwiftUI

struct IconsGrid: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency { // alternative use name selectedCurrency for @State currency
                    CurrencyView(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .shadow(color: .black.opacity(0.4), radius: 24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 3)
                    }
                } else {
                    CurrencyView(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency = Currency.goldPenny
    
    IconsGrid(currency: $currency)
}
