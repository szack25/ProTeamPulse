//
//  News-API-Caller.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/17/23.
//

import Foundation

final class NewsAPICaller {
    static let shared = NewsAPICaller()
    

    
    struct Constants {
        static let NewsAPIKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"]
        static let NewsAPIURL = "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=" + NewsAPIKey!
        
        static let topHeadlinesURL = URL(string: NewsAPIURL)
    }
    
    private init() {
        
    }
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) ->Void ) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

    struct APIResponse: Codable {
        let articles: [Article]
    }
    
    struct Article: Codable {
        let source: Source
        let title: String
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String
    }
    
    struct Source: Codable {
        let name: String
    }
    

