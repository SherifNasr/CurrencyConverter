//
//  CurrencyProvider.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import Foundation
import Alamofire
import Moya

enum CurrencyProvider{
    case latestRates
}

extension CurrencyProvider: BaseProvider{

    private var accessKey: String {
        return "a9cd27fd1095d9db08cbc0fa5ce5e1b3"
    }

    var path: String {
        switch self {
        case .latestRates:
            return "latest"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .latestRates:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .latestRates:
            return .requestParameters(parameters: ["access_key" : accessKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

    
}
