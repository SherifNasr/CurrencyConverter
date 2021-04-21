//
//  CurrencyResponse.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation

struct CurrencyResponse: Codable {
    var success: Bool
    var timestamp: Int
    var base: String
    var date: String
    var rates: [String: Double]
}


struct CurrencyRate {
    var code: String
    var rate: Double
}
