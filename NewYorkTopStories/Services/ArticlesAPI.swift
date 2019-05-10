//
//  ArticlesAPI.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import Foundation

typealias JSON = Any
typealias JSONArray = [JSON]
typealias JSONObject = [String: JSON]

class ArticleAPI {
    
func getArticlesDetails(completion: @escaping ([TopStories]) -> ()){
    let url = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=XzFdP3brCQGBB9a2AD2Ur1puE8Obel6t")
    let request = URLRequest(url: url!)
    let sessionManager = URLSession.shared
    sessionManager.dataTask(with: request) { (data, response, error) in
        
        var configuredArticles = [TopStories]()
        if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data)
            if let dictionary = json as? JSONObject,
                let articles = dictionary["results"] as? JSONArray {
                for article in articles {
                    if let article = article as? JSONObject{
                        let topStoriesArticle = TopStories(json: article)
                        configuredArticles.append(topStoriesArticle)
                    }
                }
                completion(configuredArticles)
            }
        }
        }.resume()
  }

}
