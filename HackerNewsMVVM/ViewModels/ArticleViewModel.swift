//
//  ArticleViewModel.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 08/02/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import Foundation

class ArticleViewModel {
    
    private var article: Article?
    
    var id: Int? {
        return article?.id
    }
    
    var title: String? {
        return article?.title
    }
    
    init(article: Article) {
        self.article = article
    }

}
