//
//  CurrencyTip.swift
//  01 LOTR Converter
//
//  Created by sorlenko on 24/06/2026.
//

import TipKit

struct CurrencyTip: Tip {
    let title = Text("Change Currency")
    
    let message: Text? = Text("You can tap the left or right currency to bring up the Select Currency Screen.")
    
    let image: Image? = Image(systemName: "hand.tap.fill")
}
