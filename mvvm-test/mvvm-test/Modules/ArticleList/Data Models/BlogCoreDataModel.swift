//
//  BlogCoreDataModel.swift
//  mvvm-test
//
//  Created by Soham Ray on 16/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import Foundation
import CoreData

class BlogModel: NSManagedObject {
    @NSManaged var username: String
    @NSManaged var userImage: String
    @NSManaged var postDate: String
    @NSManaged var userDesignation: String
    @NSManaged var articleImage: String
    @NSManaged var articleBody: String
    @NSManaged var articleTitle: String
    @NSManaged var articleURI: String
    @NSManaged var artileLikes: Int16
    @NSManaged var articleComments: Int16
}
