//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currentName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Current Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Current Name
            Text(currentName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currentName: "Gold Piece")
}
