//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var topCurrency: Currency
    @State var bottomCurrency: Currency
    
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
                IconGrid(currency: topCurrency)
                
                Text("Select the currency you  would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)

                // Currency Icons
                IconGrid(currency: bottomCurrency)
                
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
            .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    SelectCurrency(topCurrency: .silverPenny, bottomCurrency: .goldPenny)
}



