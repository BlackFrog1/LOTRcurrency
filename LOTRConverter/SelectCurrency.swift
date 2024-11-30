//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var currency: Currency
    
    
    var body: some View {
        ZStack {
            // Parcement background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency Icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { coin in
                        if self.currency == coin {
                            CurrencyIcon(currencyImage: coin.image, currentName: coin.name)
                                .shadow(color: .black, radius: 10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }
                        } else {
                            CurrencyIcon(currencyImage: coin.image, currentName: coin.name)
                                .onTapGesture {
                                    self.currency = coin
                                }
                        }
                    }
                }
                
                Text("Select the currency you  would like to convert to:")
                    .fontWeight(.bold)

                // Currency Icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { coin in
                        CurrencyIcon(currencyImage: coin.image, currentName: coin.name)
                    }
                }
                
                Button("Done") {
                    print(dismiss)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        
    }
}

#Preview {
    SelectCurrency(currency: .silverPenny)
}


