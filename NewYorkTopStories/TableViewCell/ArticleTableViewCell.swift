//
//  ArticleTableViewCell.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleThumbnail: AsyncImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTableViewCell(viewModel:ArticleViewModel){
        self.publishDate.text = ("Published on:\(viewModel.publishedDateString)")
        self.title.text = viewModel.titleText
        self.articleThumbnail.loadImage(urlString: viewModel.thumbnailImageUrl.absoluteString)
    }
    
}
