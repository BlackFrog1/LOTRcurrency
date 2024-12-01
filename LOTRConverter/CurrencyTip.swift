//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Collin Bennett on 11/30/24.
//

import TipKit

struct CurrencyTip: Tip {
    let title = Text("Change Currency")
    
    let message: Text? = Text("You tap the left or right curreny to bring up the Select Currency screen.")
    
    let image: Image? = Image(systemName: "hand.tap.fill")
}
