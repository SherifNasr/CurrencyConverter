//
//  ChangeCurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation
import Combine

class ChangeCurrencyViewModel {
    var rate: Double
    var baseCode: String
    var requiredCode: String

    init(rate: Double, baseCode: String, requiredCode: String) {
        self.rate = rate
        self.baseCode = baseCode
        self.requiredCode = requiredCode
    }
    
    func changeCurrency(of value: Double)->Double{
        return value * rate
    }
}
