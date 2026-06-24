//
//  CurrencyView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 15/06/2026.
//

import SwiftUI

struct CurrencyView: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
                .padding(8)
            
            // Currency Name
            Text(currencyName)
                .foregroundStyle(.white )
                .font(.caption)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .background(.brown)
        }
        .frame(width: 110, height: 110)
        .background(.brown.opacity(0.75))
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    CurrencyView(currencyImage: .silverpenny, currencyName: "Silver Penny")
}
