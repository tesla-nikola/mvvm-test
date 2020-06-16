//
//  ArticlesViewModel.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation
typealias articleCallback = (_ blogs: Blogs?, _ error: CustomError?) -> Void

protocol ArticleAPIDataProvder: class {
    var apiClient: ArtliclesListClient {get set}
    var currentPage: Int {get set}
    func getArticles(completion: @escaping articleCallback)
}

final class ArticlesViewModel: ArticleAPIDataProvder {
    var apiClient: ArtliclesListClient
    var currentPage: Int
    
    init(client: ArtliclesListClient) {
        self.apiClient = client
        self.currentPage = 1
    }
    
    func getArticles(completion: @escaping articleCallback) {
        apiClient.fetchArticles(endpoint: .blogs(page: currentPage, limit: 2)) { result in
            switch result {
            case.success(let blogs):
                completion(blogs,nil)
                break
            case .failure(let err):
                completion(nil,err)
            }
        }
    }
    
}
