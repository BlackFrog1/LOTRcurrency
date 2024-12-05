//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
//    @FocusState var leftTyping
//    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
    
    let kLeftCurrency = "LeftCurrency"
    let kRightCurrency = "RightCurrency"
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            
            VStack {
                // Prancing point image view
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left Conversion section
                    ConversionSection(currency: $leftCurrency, showSelectCurrency: $showSelectCurrency,
                                      destinationCurrency: $rightCurrency, destinationAmount: $rightAmount)
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    
                    // Right Conversion section
                    // the right side current label is flipped (right to left)
                    // and the text field alignment is trailing
                    ConversionSection(currency: $rightCurrency, showSelectCurrency: $showSelectCurrency,
                                      destinationCurrency: $leftCurrency, destinationAmount: $leftAmount,
                                      layoutDirection:  .rightToLeft)
                    //                    VStack {
                    //                        // Right Currency Label
                    //                        CurrencyLabel(rightCurrency, .rightToLeft)
                    //                        .onTapGesture {
                    //                            showSelectCurrency.toggle()
                    //                            currencyTip.invalidate(reason: .actionPerformed)
                    //                        }
                    //
                    //                        // Text field
                    //                        TextField("Amount", text: $rightAmount)
                    //                            .textFieldStyle(.roundedBorder)
                    //                            .multilineTextAlignment(.trailing)
                    //                            .focused($rightTyping)
                    //                    } // Right Conversion VStack
                } // Conversion section HStack
                .padding()
                .background(Color.black.opacity(0.5))
                .clipShape(.capsule)
                
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    
                }
            }
            //            .border(.blue)
        }
        .task {
            try? Tips.configure()
            
            // let's read default values
            let leftC = UserDefaultsManager.restore(kLeftCurrency)
            if leftC != nil {
                leftCurrency = leftC!
            }
            
            let rightC = UserDefaultsManager.restore(kRightCurrency)
            if rightC != nil {
                rightCurrency = rightC!
            }
            
        }
        .onTapGesture {
            self.endEditing()
        }
        .onChange(of: leftAmount) {
            // This is here for debugging purpose
            print ("leftAmount changed: \(leftAmount)")
        }
        .onChange(of: rightAmount) {
            // This is here for debugging purpose
            print ("rightAmount changed: \(rightAmount)")
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            UserDefaultsManager.save(leftCurrency, saveName: kLeftCurrency)
            
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            UserDefaultsManager.save(rightCurrency, saveName: kRightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
    
    private func endEditing() {
//        leftTyping = false
//        rightTyping = false
    }
}

#Preview {
    ContentView()
}


