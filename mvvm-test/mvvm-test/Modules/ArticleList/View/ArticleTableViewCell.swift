//
//  ArticleTableViewCell.swift
//  mvvm-test
//
//  Created by Soham Ray on 16/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userDesignation: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleBody: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleURI: UILabel!
    @IBOutlet weak var artileLikes: UILabel!
    @IBOutlet weak var articleComments: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImage.layer.cornerRadius = 22.5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userImage.image = nil
          articleImage.image = nil
    }
    
    func populateCell(_ blog: BlogUserRepresentableModel) {
        userImage.imageFromServerURL(blog.userImage, placeHolder: nil)
        username.text = blog.username
        userDesignation.text = blog.userDesignation
        
        articleBody.text = blog.articleBody
        postDate.text = blog.postDate
        articleTitle.text = blog.articleTitle
        articleURI.text = blog.articleURI
        if let imageURL = blog.articleImage  {
            articleImage.imageFromServerURL(imageURL, placeHolder: nil)
        } else {
            //remove and adjust size of the cell
        }
        
        artileLikes.text = blog.articleLikes > 1000 ? "\(Double(blog.articleLikes)/1000.0)K Likes" : "\(blog.articleLikes) Likes"
        articleComments.text = blog.articleComments > 1000 ? "\(Double(blog.articleComments)/1000.0)K Comments" : "\(blog.articleComments) Comments"

    }
    
}
