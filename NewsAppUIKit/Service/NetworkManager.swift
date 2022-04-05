//
//  NetworkManager.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/04.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURLString = "https://newsapi.org/v2/"
    private let USTopHeadline = "top-headlines?country=us"
    
    func getNews(completion: @escaping ([Article]?) -> ()) {
        let URLString = "\(baseURLString)\(USTopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: URLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let news = try? JSONDecoder().decode(News.self, from: data)
            news == nil ? completion(nil) : completion(news!.articles)
        }
        .resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }
            .resume()
        }
    }
}
