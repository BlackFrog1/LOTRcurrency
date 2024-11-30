//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    
    var body: some View {
        HStack{
            // Left currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange text
            Text(text)
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, text: "1 Silver Piece = 4 Silver Pennies")
}
