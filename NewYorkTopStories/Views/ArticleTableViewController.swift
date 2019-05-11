//
//  ArticleTableViewController.swift
//  NewYorkTopStories
//
//  Created by Parmodh on 09/05/19.
//  Copyright © 2019 exercise. All rights reserved.
//

import UIKit

class ArticleTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var articleViewModel : [ArticleViewModel]?
    var activityView = UIActivityIndicatorView()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        self.tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        self.fetchArticles()
        // Do any additional setup after loading the view, typically from a nib.ret
    }
    
    func fetchArticles(){
        ArticleAPI().getArticlesDetails() { TopStories in
            print(TopStories)
            let articles = TopStories.map { article in
                return ArticleViewModel(topStories :article)
            }
            self.articleViewModel = articles
    
            DispatchQueue.main.async { [weak self] in
                self?.activityView.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(articleViewModel != nil){
            return self.articleViewModel!.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ArticleTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        cell.selectionStyle = .none
        cell.configureTableViewCell(viewModel: articleViewModel![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Details", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            let detailView: DetailViewController = segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            detailView.articleViewModel = self.articleViewModel![(indexPath?.row)!]
        }
        
    }
    
}

