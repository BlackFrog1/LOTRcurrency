//
//  ExtractedView.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 12/4/24.
//

import SwiftUI

struct CurrencyLabel: View {
    private let currency: Currency
    private let layout: LayoutDirection
    
    // created by own init because I wanted to hide the label
    init(_ currency: Currency, _ layoutDirection: LayoutDirection = .leftToRight) {
        self.currency = currency
        self.layout = layoutDirection
    }
    
    var body: some View {
        HStack {
            FlipGroup(if: layout) {
                // Normal layout is image, then text
                // Currency Image
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                // Currency Text
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
        .padding(.bottom, -5)
    }
        
    // Found the following idea on Stack overflow
    // https://stackoverflow.com/a/62652866/256728
    // Do I understand the whole @ViewBuilder - no
    // But I know what a Tuple is
    @ViewBuilder
    func FlipGroup<V1: View, V2: View>(if value: LayoutDirection,
                                       @ViewBuilder _ content: @escaping () -> TupleView<(V1, V2)>) -> some View {
        let pair = content()
        if value == .rightToLeft {
            TupleView((pair.value.1, pair.value.0))
        } else {
            TupleView((pair.value.0, pair.value.1))
        }
    }
}
