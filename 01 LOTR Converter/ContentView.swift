//
//  ContentView.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 12/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfoSheet = false
    @State var showSelectCurrencySheet = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .goldPenny
    @State var rightCurrency: Currency = .silverPenny
    
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
                    }
                    
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
                        }
                        
                        // Text Field
                        TextField("Amount", text: $rightAmount, prompt: Text("Amount").foregroundStyle(.black.opacity(0.4)))
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(.trailing)
                            .background(.white)
                            .clipShape(.capsule)
                            .font(.title2)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.5))
                
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
