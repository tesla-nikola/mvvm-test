//
//  ArticlesClient.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation

final class ArtliclesListClient: APIClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func fetchArticles(endpoint: APIEndpointType, completion: @escaping (Result<Blogs?, CustomError>) -> Void) {
        fetch(with: endpoint.request,
              decode: {
                json -> Blogs? in
                guard let blogs = json as? Blogs else { return nil }
                return blogs
            },
              completion: completion)
    }
}
