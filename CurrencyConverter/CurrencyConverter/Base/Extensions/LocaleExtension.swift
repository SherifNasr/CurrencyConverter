//
//  LocaleExtension.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation

extension Locale{
    
    static func countryCode(ofCurrencyCode currencyCode: String)-> String {
       let locales =  Locale.availableIdentifiers.map(Locale.init).filter { $0.currencyCode == currencyCode }
        return locales.last?.regionCode ?? ""
    }
}
