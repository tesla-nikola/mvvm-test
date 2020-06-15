//
//  APIEndpointType.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation

public enum APIEndpointType : Endpoint {
    
    case blogs(page: Int, limit: Int)
    
    var path: String {
        switch self {
        case .blogs:
            return "/jet2/api/v1/blogs"
        }
    }
    
    var base: String {
        switch self {
        case .blogs:
            return "https://5e99a9b1bc561b0016af3540.mockapi.io"
        }
    }
    
    var query: [URLQueryItem] {
        switch self {
        case .blogs(let page, let limit):
            return [URLQueryItem(name: "offset", value: "\(page)"),
                    URLQueryItem(name: "limit", value: "\(limit)")]
        }
    }
    
}
