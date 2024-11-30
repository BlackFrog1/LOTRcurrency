//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct IconGrid: View {
    @State var currency: Currency
    
    var body: some View {
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
    }
}

#Preview {
    IconGrid(currency: .goldPiece)
}
