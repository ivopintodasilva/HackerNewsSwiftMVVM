//
//  Urls.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Foundation

enum urlType {
    case top
    case item(id: Int)
}

class Urls {

    static func getUrl(type: urlType) -> String {
        
        switch type {
        case .top: return "https://hacker-news.firebaseio.com/v0/topstories.json"
        case .item(let id): return "https://hacker-news.firebaseio.com/v0/item/\(id).json"
        }
        
    }
}
