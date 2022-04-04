//
//  News.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/04.
//

import Foundation

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
