//
//  SelectCurrencyView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 15/06/2026.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency Icons
                IconsGrid(currency: $topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top, 16)
                
                // Currency Icons
                IconsGrid(currency: $bottomCurrency)
                
                // Button "Dismiss"
                Button() {
                    dismiss()
                    
                } label: {
                    Text("Dismiss")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .foregroundStyle(.white)
                        .background(
                            ZStack {
                                // Base blue fill
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(.black.mix(with: .brown, by: 0.5).opacity(0.5))
                                
                                // Top inner highlight (the "bubble" edge glow)
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(
                                        LinearGradient(
                                            colors: [.white.opacity(0.35), .clear],
                                            startPoint: .top,
                                            endPoint: .center
                                        )
                                    )
                                
                                // Subtle border glow
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .strokeBorder(.white.opacity(0.25), lineWidth: 1.5)
                            }
                        )
                        .buttonStyle(.plain)
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.top, 16)
            }
            .padding(10)
            .multilineTextAlignment(.center)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    @Previewable @State var topCurrency = Currency.goldPenny
    @Previewable @State var bottomCurrency = Currency.silverPenny
    
    SelectCurrencyView(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
