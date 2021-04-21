//
//  CurrencyRatesViewModel.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation
import Combine

class CurrencyRatesViewModel: ObservableObject {
    
    @Published var base: String = ""
    @Published var rates:[CurrencyRate] = []
    @Published var error: MyError?
    
    func getRates(){
        RequestManager.beginRequest(with: CurrencyProvider.latestRates,
                                    responseModel: CurrencyResponse.self) {[weak self] (response, error) in
            if error == nil,
               let response = response as? CurrencyResponse{
                self?.base = response.base
                var tempRates:[CurrencyRate] = []
                response.rates.forEach { (key, value) in
                    tempRates.append(CurrencyRate(code: key, rate: value))
                }
                self?.rates = tempRates
            } else {
                self?.error = error
            }
        }
    }
    
    
    func getNumberOfRates() -> Int {
        return rates.count
    }
    
    func rate(at index: Int) -> Double? {
        guard index < rates.count else {
            return nil
        }
        return rates[index].rate
    }
    
    func code(at index: Int) -> String {
        guard index < rates.count else {
            return ""
        }
        return rates[index].code
    }
        
}
