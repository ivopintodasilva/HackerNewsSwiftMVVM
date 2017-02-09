//
//  InitialViewModel.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Foundation
import PromiseKit

class NewsViewModel {
    
    /// Redux-like state
    private(set) var state: NewsState = NewsState()
    
    /// Handler for the state change event
    var stateChangeHandler: ((NewsState.Change) -> Void)?
    
    
    /// ViewModel attributes
    var source: String? {
        return "Hacker News"
    }
    
    var articles: [ArticleViewModel]? {
        /// Returns an array of ArticleViewModel objects
        return state.articles.map { ArticleViewModel(article: $0) }
    }
    
    
    /**
     Firstly, fetches the id's of the top stories.
     Then, fetches the articles that correspond to those id's
     */
    func fetchNews() {
        
        let stateChange: NewsState.Change = state.updateFetching(fetching: true)
        stateChangeHandler?(stateChange)
        
        _ = Request
            .requestTopStories()
            .then(execute: fetchArticles)
            .then { articles -> Void in
                
                let fetchStateChange: NewsState.Change = self.state.updateFetching(fetching: false)
                self.stateChangeHandler?(fetchStateChange)
                
                let newsStateChange: NewsState.Change = self.state.updateArticles(articles: articles)
                self.stateChangeHandler?(newsStateChange)
                
            }
    }
    
    /**
     Wait until all articles are fetched
     */
    private func fetchArticles(ids: [Int]) -> Promise<[Article]>  {
        let promises = ids[0...50].map { fetchArticle(id: $0) }
        return when(fulfilled: promises)
    }
    
    /**
     Fetches an article
     */
    private func fetchArticle(id: Int) -> Promise<Article> {
        return Request.requestArticle(id: id)
    }
}
