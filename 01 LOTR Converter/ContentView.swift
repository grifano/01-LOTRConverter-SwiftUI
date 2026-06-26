//
//  ContentView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 12/06/2026.
//

// 🏆 Coding Challenges
// 1. ✅ Add one more currency
// 2. ✅ Persist Currency, after app close, save last selected currencies.
// 3. ✅ Dismiss keyboard
// 4. Refactor Currency Convertion Section. Move to separet file.

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfoSheet = false
    @State var showSelectCurrencySheet = false
    
    let currencyTip = CurrencyTip()
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency
    @State var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Logo Pony
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.top, 16)
                
                // Converter Title
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Curencies Section
                HStack {
                    // Left Currency Block
                    CurrencyField(currency: $leftCurrency, currencyAmount: $leftAmount, isFocused: $leftTyping, onTap: {
                        showSelectCurrencySheet.toggle()
                    })
                    .onTapGesture {
                        currencyTip.invalidate(reason: .actionPerformed)
                    }
                    .popoverTip(currencyTip, arrowEdge: .bottom)
                    
                    // =
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Currency Block
                    CurrencyField(currency: $rightCurrency, currencyAmount: $rightAmount, isFocused: $rightTyping, onTap: {
                        showSelectCurrencySheet.toggle()
                    })
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.5))
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Info Button
                Spacer()
                Button {
                    showExchangeInfoSheet.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(16)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            UserDefaults.standard.set(leftCurrency.rawValue, forKey: "Left Currency")
        }
        .onChange(of: rightCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            UserDefaults.standard.set(rightCurrency.rawValue, forKey: "Right Currency")
        }
        .sheet(isPresented: $showExchangeInfoSheet) {
            ExchangeInfoSheetView()
        }
        .sheet(isPresented: $showSelectCurrencySheet) {
            SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .onAppear() {
            let storredLeftCurrencyRawValue = UserDefaults.standard.double(forKey: "Left Currency")
            let storredRightCurrencyRawValue = UserDefaults.standard.double(forKey: "Right Currency")
            
            leftCurrency = Currency(rawValue: storredLeftCurrencyRawValue) ?? .goldPenny
            rightCurrency = Currency(rawValue: storredRightCurrencyRawValue) ?? .silverPenny
        }
    }
}
#Preview {
    ContentView(leftCurrency: .copperBit, rightCurrency: .copperPenny)
}
