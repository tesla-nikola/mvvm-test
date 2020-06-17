//
//  Article.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation

typealias Blogs = [Blog]

// MARK: - Blog
struct Blog: Codable {
    let id, createdAt, content: String
    let comments, likes: Int
    let media: [Media]
    let user: [User]
    
    var createdDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: createdAt)
        return date ?? Date()
    }
}

// MARK: - Media
struct Media: Codable {
    let id, blogID, createdAt: String
    let image: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, image, title, url
    }
}

// MARK: - User
struct User: Codable {
    let id, blogID, createdAt, name: String
    let avatar: String
    let lastname, city, designation, about: String

    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, name, avatar, lastname, city, designation, about
    }
}
