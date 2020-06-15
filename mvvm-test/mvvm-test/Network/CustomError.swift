//
//  APIError.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case noNetwork
    case noData
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return AppConstants.requestFailed
        case .invalidData: return AppConstants.invalidData
        case .responseUnsuccessful: return AppConstants.responseUnsuccessful
        case .jsonParsingFailure: return AppConstants.jsonParsingFailure
        case .jsonConversionFailure: return AppConstants.jsonConversionFailure
        case .noNetwork: return AppConstants.noNetwork
        case .noData: return AppConstants.noData
        }
    }
}


struct AppConstants {
    static let requestFailed = "Request Failed"
    static let invalidData = "Invalid Data"
    static let responseUnsuccessful = "Response Unsuccessful"
    static let jsonParsingFailure = "JSON Parsing Failure"
    static let jsonConversionFailure = "JSON Conversion Failure"
    static let noNetwork = "No Internet. Please check your internet connection"
    static let noData = "No Data"
}
