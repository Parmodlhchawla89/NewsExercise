//
//  ArticleViewModel.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 10/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import Foundation

public class ArticleViewModel: NSObject {
    let titleText: String
    let publishedDateString: String
    let abstract: String
    let thumbnailImageUrl: URL
    let detailImageUrl: URL

    init(topStories:TopStories) {
        self.titleText = topStories.title
        self.publishedDateString = topStories.publishDate
        self.abstract = topStories.abstract
        if let thumbnail = topStories.media.thumbnailImageUrl{
            self.thumbnailImageUrl = thumbnail
        }else{
            self.thumbnailImageUrl = URL(string: "")!
        }
        if let detailImageUrl = topStories.media.detailImageUrl{
            self.detailImageUrl = detailImageUrl
        }else{
            self.detailImageUrl = URL(string: "")!
        }
    }
}

