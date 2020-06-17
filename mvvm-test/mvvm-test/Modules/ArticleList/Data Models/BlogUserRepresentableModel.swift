//
//  BlogUserRepresentableModel.swift
//  mvvm-test
//
//  Created by Soham Ray on 17/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation

class BlogUserRepresentableModel {
    var username: String
    var userImage: String
    var postDate: String
    var userDesignation: String
    var articleImage: String?
    var articleBody: String
    var articleTitle: String
    var articleURI: String
    var articleLikes: Int
    var articleComments: Int
    
    init(username: String, userImage: String, postDate: String, userDesignation: String,
         articleImage: String?, articleBody: String, articleTitle: String, articleURI: String,
         articleLikes: Int, articleComments: Int) {
        self.userImage = userImage
        self.username = username
        self.userDesignation = userDesignation
        self.articleImage = articleImage
        self.articleBody = articleBody
        self.postDate = postDate
        self.articleTitle = articleTitle
        self.articleURI = articleURI
        self.articleLikes = articleLikes
        self.articleComments = articleComments
    }
    
    init() {
        self.userImage = ""
        self.username = ""
        self.userDesignation = ""
        self.articleImage = ""
        self.articleBody = ""
        self.postDate = ""
        self.articleTitle = ""
        self.articleURI = ""
        self.articleLikes = 0
        self.articleComments = 0
    }
}
