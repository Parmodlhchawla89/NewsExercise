//
//  DetailViewController.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 10/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var articleViewModel : ArticleViewModel?
    @IBOutlet weak var articleImage: AsyncImageView!
    @IBOutlet weak var articleDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleDetailLabel.text = self.articleViewModel!.abstract
        self.articleImage.loadImage(urlString: (articleViewModel?.detailImageUrl.absoluteString)!)
        // Do any additional setup after loading the view.
    }

}
