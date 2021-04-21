//
//  BaseProvider.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation
import Moya

protocol BaseProvider : TargetType{
    
}

extension BaseProvider {
    var baseURL: URL {
        if let url = URL(string: BaseUrl){
            return url
        }
        fatalError("Base url not found")
    }
}
