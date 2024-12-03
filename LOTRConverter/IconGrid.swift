//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { coin in
                let icon = CurrencyIcon(currencyImage: coin.image, currentName: coin.name)
                if currency == coin {
                        icon.shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    icon.onTapGesture {
                            currency = coin
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency = Currency.goldPiece
    IconGrid(currency: $currency)
}
