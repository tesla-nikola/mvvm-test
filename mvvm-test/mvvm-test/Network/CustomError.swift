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
    case managedObjectContextNotFound
    case couldNotSaveObject
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return AppConstants.requestFailed
        case .invalidData: return AppConstants.invalidData
        case .responseUnsuccessful: return AppConstants.responseUnsuccessful
        case .jsonParsingFailure: return AppConstants.jsonParsingFailure
        case .jsonConversionFailure: return AppConstants.jsonConversionFailure
        case .noNetwork: return AppConstants.noNetwork
        case .noData: return AppConstants.noData
        case .managedObjectContextNotFound: return AppConstants.managedObjectContextNotFound
        case .couldNotSaveObject: return AppConstants.couldNotSaveObject
        }
    }
}
