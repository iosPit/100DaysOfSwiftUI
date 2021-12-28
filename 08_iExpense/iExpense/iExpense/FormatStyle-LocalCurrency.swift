//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Pitambar Dayal on 12/26/21.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
