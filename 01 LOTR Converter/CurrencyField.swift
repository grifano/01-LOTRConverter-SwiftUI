//
//  CurrencyField.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 25/06/2026.
//

import SwiftUI

struct CurrencyField: View {    
    @Binding var currency: Currency
    @Binding var currencyAmount: String
    
    var isFocused: FocusState<Bool>.Binding
//    @Binding var isTapped: Bool
    
    var onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            // Select Left Currency
            HStack {
                // Currency Image
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                // Currency Name
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                onTap()
            }
            
            // Text Field
            TextField(text: $currencyAmount, prompt: Text("Amount").foregroundStyle(.black.opacity(0.4))) {
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal, 10)
            .background(.white)
            .clipShape(.capsule)
            .font(.title2)
            .foregroundStyle(.black)
            .focused(isFocused)
        }
    }
}

#Preview {
    @Previewable @State var currency = Currency.goldPenny
    @Previewable @State var currencyAmount = ""
    @Previewable @FocusState var isFocused: Bool
    
    CurrencyField(currency: $currency, currencyAmount: $currencyAmount, isFocused: $isFocused, onTap: {})
}
