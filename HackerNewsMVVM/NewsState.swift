//
//  NewsState.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 09/02/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import Foundation

struct NewsState {
    var articles: [Article] = []
    var fetching: Bool = false
}

extension NewsState {
    
    enum Change {
        case none
        case fetchStateChanged
        case newsChanged
    }

    mutating func updateArticles(articles: [Article]) -> Change {
        self.articles = articles
        return .newsChanged
    }
    
    mutating func updateFetching(fetching: Bool) -> Change {
        self.fetching = fetching
        return .fetchStateChanged
    }
    
}
