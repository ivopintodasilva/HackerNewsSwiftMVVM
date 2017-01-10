//
//  InitialViewModel.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Foundation
import PromiseKit

class InitialViewModel {

    let news: News

    init() {
        news = News(source: "Hacker News")
        
        fetchNews()
    }
    
    /**
     Firstly, fetches the id's of the top stories.
     Then, fetches the articles that correspond to those id's
     */
    func fetchNews() {
        
        _ = Request
            .requestTopStories()
            .then(execute: fetchArticles)
            .then { articles in articles.forEach { self.news.addArticle(article: $0) }
                
        }
    }
    
    /**
     Wait until all articles are fetched
     */
    func fetchArticles(ids: [Int]) -> Promise<[Article]>  {
        let promises = ids[0...50].map { fetchArticle(id: $0) }
        return when(fulfilled: promises)
    }
    
    /**
     Fetches on article
     */
    func fetchArticle(id: Int) -> Promise<Article> {
        return Request.requestArticle(id: id)
    }
}
