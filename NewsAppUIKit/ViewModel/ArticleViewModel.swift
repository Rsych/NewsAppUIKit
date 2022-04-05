//
//  NewsViewModel.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/05.
//

import Foundation

struct ArticleViewModel {
    let article: Article
    
    var author: String {
        return article.author ?? "Unknown"
    }
    
    var title: String {
        return article.title ?? ""
    }
    
    var description: String {
        return article.description ?? ""
    }
    
    var url: String {
        return article.url ?? ""
    }
    
    var urlToImage: String {
        return article.urlToImage ?? ""
    }
}
