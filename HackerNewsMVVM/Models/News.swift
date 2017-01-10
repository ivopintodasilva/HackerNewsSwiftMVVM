//
//  News.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Foundation

class News {
    
    let source: String
    private(set) var articles: [Article]
    
    init(source: String) {
        self.source = source
        self.articles = []
    }
    
    func addArticle(article: Article) {
        articles.append(article)
    }
    
}
