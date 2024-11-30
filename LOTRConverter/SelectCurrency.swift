//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
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
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: .copperpenny, currentName: "Copper Penny")
                    }

                }
                
                
//                CurrencyIcon(currencyImage: .copperpenny, currentName: "Copper Penny")
                
                Text("Select the currency you  would like to convert to:")
                    .fontWeight(.bold)
                
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
    SelectCurrency()
}


