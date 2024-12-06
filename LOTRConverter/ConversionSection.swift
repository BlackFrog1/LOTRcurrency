//
//  ConversionSection.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 12/5/24.
//

import SwiftUI

struct ConversionSection: View {
    
    @State private var amount = ""
    @FocusState private var typing
    
    
    @Binding var currency: Currency
    @Binding var showSelectCurrency: Bool
    
    @Binding var destinationCurrency: Currency
    @Binding var destinationAmount: String
    
    var layoutDirection: LayoutDirection = .leftToRight
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        VStack {
            // Currency label
            let label = CurrencyLabel(currency, layoutDirection)
                .onTapGesture {
                    showSelectCurrency.toggle()
                    currencyTip.invalidate(reason: .actionPerformed)
                }
            // we only want tip to appear over one label, we dont need it over both
            if layoutDirection == .leftToRight {
                label.popoverTip(currencyTip, arrowEdge: .bottom)
            } else {
                label
            }
                
            
            // Text field for entering amount of currency
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($typing)
                .keyboardType(.decimalPad)
            // adjust the text alignment based on
                .multilineTextAlignment(layoutDirection == .leftToRight ? .leading : .trailing)
        }
        .onChange(of: amount) {
            if typing {
                destinationAmount = currency.convert(amount, to: destinationCurrency)
                // print startement for debugging purpose.
                // checking that the calculation is working
                print("Currency: \(currency), Amount: \(amount), Destination Amount: \(destinationAmount) ")
            }
        }
    }
}
