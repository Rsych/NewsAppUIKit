//
//  NewsListViewModel.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/05.
//

import Foundation

class NewsListViewModel {
    var newsVM = [ArticleViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([ArticleViewModel]) -> ()) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            let newsVM = news.map(ArticleViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
