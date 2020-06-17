//
//  BlogsLocalClient.swift
//  mvvm-test
//
//  Created by Soham Ray on 17/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation
import CoreData

class BlogsLocalClient {
    
    func saveBlogs(blogs: [BlogUserRepresentableModel]) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw CustomError.managedObjectContextNotFound
        }
        
        if let blogEntity = NSEntityDescription.entity(forEntityName: "BlogModel",
                                                       in: managedOC) {
            for blog in blogs {
                let blogToBeSaved = BlogModel(entity: blogEntity, insertInto: managedOC)
                blogToBeSaved.username = blog.username
                blogToBeSaved.userDesignation = blog.userDesignation
                blogToBeSaved.userImage = blog.userImage
                blogToBeSaved.articleTitle = blog.articleTitle
                blogToBeSaved.articleBody = blog.articleBody
                blogToBeSaved.articleImage = blog.articleImage ?? ""
                blogToBeSaved.articleURI = blog.articleURI
                blogToBeSaved.articleLikes = Int64(blog.articleLikes)
                blogToBeSaved.articleComments = Int64(blog.articleComments)
                try managedOC.save()
            }

        } else {
            throw CustomError.couldNotSaveObject
        }
    }
    
    func retreiveBlogs() throws -> [BlogUserRepresentableModel] {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw CustomError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<BlogModel> = NSFetchRequest(entityName: String(describing: BlogModel.self))
        
        let localBlogs = try managedOC.fetch(request)
        var blogs: [BlogUserRepresentableModel] = []
        for eachBlog in localBlogs {
            blogs.append(
                BlogUserRepresentableModel(username: eachBlog.username, userImage: eachBlog.userImage, postDate: eachBlog.postDate, userDesignation: eachBlog.userDesignation, articleImage: eachBlog.articleImage, articleBody: eachBlog.articleBody, articleTitle: eachBlog.articleTitle, articleURI: eachBlog.articleURI, articleLikes: Int(eachBlog.articleLikes), articleComments: Int(eachBlog.articleComments))
            )
        }
        
        return blogs
    }
}
