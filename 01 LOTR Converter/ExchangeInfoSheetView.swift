//
//  ExchangeInfoSheetView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 15/06/2026.
//

import SwiftUI

struct ExchangeInfoSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(1.5)
                    .padding(.bottom, 8)
                
                // Description
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .lineSpacing(7)
                    .padding(.horizontal,16)
                    .padding(.bottom,8)
                
                // Currency Exchange Details Row
                VStack {
                    // Left Currency Icon
                    ExchangeRateView(leftCurrencyIcon: .goldpiece, rateNoteText: "1 Gold Piece = 4 Gold Pennies", rightCurrencyIcon: .goldpenny)
                    ExchangeRateView(leftCurrencyIcon: .goldpenny, rateNoteText: "1 Gold Penny = 4 Silver Pieces", rightCurrencyIcon: .silverpiece)
                    ExchangeRateView(leftCurrencyIcon: .silverpiece, rateNoteText: "1 Silver Piece = 4 Silver Pennies", rightCurrencyIcon: .silverpenny)
                    ExchangeRateView(leftCurrencyIcon: .silverpenny, rateNoteText: "1 Silver Penny = 100 Copper Pennies", rightCurrencyIcon: .copperpenny)
                    ExchangeRateView(leftCurrencyIcon: .copperpenny, rateNoteText: "1 Copper Penny = 4 Copper Bits", rightCurrencyIcon: .copperbit)
                }
                .padding(4)
                
                // Dismiss Button
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
                .padding(16)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ExchangeInfoSheetView()
}
