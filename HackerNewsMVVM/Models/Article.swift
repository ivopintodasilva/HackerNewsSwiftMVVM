//
//  Article.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Argo
import Ogra
import Curry
import Runes

class Article {
    
    let id: Int
    let by: String?
    let title: String?
    let descendants: Int?
    let kids: [Int]?
    let score: Int?
    let type: String?
    let url: String?
    
    init(id: Int, by: String?, title: String?, descendants: Int?, kids: [Int]?, score: Int?, type: String?, url: String?) {
        self.id = id
        self.by = by
        self.title = title
        self.descendants = descendants
        self.kids = kids
        self.score = score
        self.type = type
        self.url = url
    }
}

extension Article: Equatable {}

func ==(lhs: Article, rhs: Article) -> Bool {
    return lhs.id == rhs.id
}

extension Article: Decodable {
    public static func decode(_ json: JSON) -> Decoded<Article> {
        
        let a1 = curry(Article.init)
            <^> json <| "id"
            <*> json <|? "by"
            <*> json <|? "title"
            
        let a2 = a1
            <*> json <|? "descendants"
            <*> json <||? "kids"
            <*> json <|? "score"
        
        return a2
            <*> json <|? "type"
            <*> json <|? "url"
    }
}
