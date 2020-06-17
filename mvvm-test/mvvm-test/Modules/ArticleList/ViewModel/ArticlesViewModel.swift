//
//  ArticlesViewModel.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation
typealias articleCallback = (_ status: Bool, _ error: CustomError?) -> Void

protocol ArticleAPIDataProvder: class {
    var apiClient: ArtliclesListClient {get set}
    var currentPage: Int {get set}
    func getArticles(completion: @escaping articleCallback)
}

final class ArticlesViewModel: ArticleAPIDataProvder {
    var apiClient: ArtliclesListClient
    var currentPage: Int
    var blogsList : [BlogUserRepresentableModel]
    let dbClient = BlogsLocalClient()
    
    init(client: ArtliclesListClient) {
        self.apiClient = client
        self.currentPage = 1
        self.blogsList = []
    }
    
    func getArticles(completion: @escaping articleCallback) {
        if Reachability.isConnectedToNetwork() {
            apiClient.fetchArticles(endpoint: .blogs(page: currentPage, limit: 10)) { [weak self] result in
                guard let welf = self else { return }
                switch result {
                case.success(let blogs):
                    let newBlogs = welf.covertToRepresentable(blogs: blogs ?? [])
                    welf.blogsList.append(contentsOf: newBlogs)
                    do {
                        try welf.dbClient.saveBlogs(blogs: newBlogs)
                    } catch {}
                    completion(true,nil)
                case .failure(let err):
                    completion(false,err)
                }
                
            }
        } else {
            do {
                try blogsList = dbClient.retreiveBlogs()
            } catch {}
            completion(false, CustomError.noNetwork)
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
