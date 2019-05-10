
// The MIT License (MIT)
//
// Copyright (c) 2015 James Tang (j@jamztang.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
import UIKit

//
//  AsyncImageView.swift
//  MnetSwiftTest
//
//  Created by OHSEUNGWOOK on 2017. 1. 31..
//  Copyright © 2017년 OHSEUNGWOOK. All rights reserved.
//
import UIKit

class AsyncImageView: UIImageView {
    
    func loadImage(urlString: String){
        
        let urlStr :String = urlString;
        if !urlStr.isEmpty {
            
            let CACHE_SEC : TimeInterval = 5 * 60;
            
            let request = URLRequest(url: URL(string: urlStr)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: CACHE_SEC)
            let conf =  URLSessionConfiguration.default;
            let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main);
            
            let task = session.dataTask(with: request){ data, response, error in
                
                if (error == nil){
                    
                    let image = UIImage(data:data!)
                    self.image = image;
                    
                } else { //Error
                    print("AsyncImageView:Error \(error?.localizedDescription ?? "")");
                }
            }
            
            task.resume()
        }
    }
}
