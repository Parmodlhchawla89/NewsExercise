//
//  Articles.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
public class TopStories: NSObject {
    let title: String
    let publishDate: String
    let abstract: String
    let media: ArticleMedia
    init(json: JSONObject) {
        self.title = json["title"] as? String ?? ""
        self.publishDate = json["published_date"] as? String ?? ""
        self.abstract = json["abstract"] as? String ?? ""
        self.media = ArticleMedia(jsonFromFeaturedArticle: json)
    }
}
public class ArticleMedia: NSObject {
    let thumbnailImageUrl: URL?
    let detailImageUrl: URL?
    init(jsonFromFeaturedArticle: JSONObject) {
        var thumbnailUrl: URL?
        var detailUrl: URL?
        if let media = jsonFromFeaturedArticle["media"] as? JSONArray, let metaData = media.first as? JSONObject,
            let mediaMetadata = metaData["media-metadata"] as? JSONArray {
            if let imageComposite = mediaMetadata[safe: 1] as? JSONObject {
                if let thumbnailUrlString = imageComposite["url"] as? String {
                    thumbnailUrl = URL(string: thumbnailUrlString)
                }
            }
            if let imageComposite = mediaMetadata.first as? JSONObject {
                if let detailUrlString = imageComposite["url"] as? String {
                    detailUrl = URL(string: detailUrlString)
                }
            }
        }
        self.detailImageUrl = detailUrl
        self.thumbnailImageUrl = thumbnailUrl
    }
}
