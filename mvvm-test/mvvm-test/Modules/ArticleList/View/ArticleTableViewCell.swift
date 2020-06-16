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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populateCell(_ blog: Blog) {
        if let firstUser = blog.user.first {
            userImage.imageFromServerURL(firstUser.avatar, placeHolder: nil)
            username.text = firstUser.name
            userDesignation.text = firstUser.designation
        }
        
        articleBody.text = blog.content
        
        if let media = blog.media.first {
            articleTitle.text = media.title
            articleURI.text = media.url
            articleImage.imageFromServerURL(media.image, placeHolder: nil)
        }
        
        artileLikes.text = "\(blog.likes)"
        articleComments.text = "\(blog.comments)"

    }
    
}
