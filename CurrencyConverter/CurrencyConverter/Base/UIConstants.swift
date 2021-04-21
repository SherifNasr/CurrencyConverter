//
//  UIConstants.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit

struct UIConstants {
    struct Cells {
        static let currencyRateCell = "CurrencyRateCell"
    }
}

enum Storyboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
}

enum ViewController {
    case currencyRates(storyboard: Storyboard)
    case changeCurrency(storyboard: Storyboard)
    
    var instance: UIViewController {
        switch self {
        case .currencyRates(let storyboard):
            return storyboard.instance.instantiateViewController(withIdentifier: "CurrencyRatesViewController")
        case .changeCurrency(let storyboard):
            return storyboard.instance.instantiateViewController(withIdentifier: "ChangeCurrencyViewController")
        }
    }

}
