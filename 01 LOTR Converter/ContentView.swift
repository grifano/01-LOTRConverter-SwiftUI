//
//  ContentView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 12/06/2026.
//

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
    
    @State var leftCurrency: Currency = .goldPiece
    @State var rightCurrency: Currency = .silverPiece
    
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
                    VStack {
                        // Select Left Currency
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Name
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrencySheet.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // Text Field
                        TextField(text: $leftAmount, prompt: Text("Amount").foregroundStyle(.black.opacity(0.4))) {
                        }
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .clipShape(.capsule)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .focused($leftTyping)
                    }
                    .popoverTip(currencyTip, arrowEdge: .bottom)
                    
                    // =
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Currency Block
                    VStack {
                        // Select Right Currency
                        HStack {
                            // Currency Name
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrencySheet.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // Text Field
                        TextField("Amount", text: $rightAmount, prompt: Text("Amount").foregroundStyle(.black.opacity(0.4)))
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(.trailing)
                            .background(.white)
                            .clipShape(.capsule)
                            .font(.title2)
                            .focused($rightTyping)
                    }
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
        }
        .onChange(of: rightCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .sheet(isPresented: $showExchangeInfoSheet) {
            ExchangeInfoSheetView()
        }
        .sheet(isPresented: $showSelectCurrencySheet) {
            SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}
#Preview {
    ContentView()
}
