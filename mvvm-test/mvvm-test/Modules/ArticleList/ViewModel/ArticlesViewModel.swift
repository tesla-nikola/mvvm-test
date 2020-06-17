//
//  ArticlesViewModel.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation
typealias articleCallback = (_ blogs: [BlogUserRepresentableModel]?, _ error: CustomError?) -> Void

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
        apiClient.fetchArticles(endpoint: .blogs(page: currentPage, limit: 10)) { [weak self] result in
            guard let welf = self else { return }
            switch result {
            case.success(let blogs):
                let articles = welf.covertToRepresentable(blogs: blogs ?? [])
                completion(articles,nil)
            case .failure(let err):
                completion(nil,err)
            }
        }
    }
    
    private func covertToRepresentable(blogs: [Blog]) -> [BlogUserRepresentableModel] {
        var blogsData: [BlogUserRepresentableModel] = []
        blogs.forEach({(blog) in
            let model = BlogUserRepresentableModel()
            if let firstUser = blog.user.first {
                model.userDesignation = firstUser.designation
                model.username = firstUser.name
                model.userImage = firstUser.avatar
            }
            
            if let firstMedia = blog.media.first {
                model.articleTitle = firstMedia.title
                model.articleImage = firstMedia.image
                model.articleURI = firstMedia.url
            }
            
            model.articleBody = blog.content
            model.postDate = blog.createdAt
            model.articleComments = blog.comments
            model.articleLikes = blog.likes
            blogsData.append(model)
        })
        
        return blogsData
    }
    
    
}
