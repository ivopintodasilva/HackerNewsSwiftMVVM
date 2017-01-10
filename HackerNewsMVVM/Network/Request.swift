//
//  Request.swift
//  MVVMTest
//
//  Created by Ivo Silva on 10/01/17.
//

import Argo
import Ogra
import Foundation
import Alamofire
import PromiseKit
import PMKAlamofire
import UIKit

class Request {
    
    static func requestTopStories() -> Promise<[Int]> {
        
        showNetworkActivityIndicator()
        
        let url: String = Urls.getUrl(type: .top)
        
        return Alamofire.request(url)
            .responseJSON()
            .then{ json in
                
                return Promise { fulfill, reject in
                    if let array = json as? [Int] {
                        fulfill(array)
                    } else {
                        reject(CustomError.parsing)
                    }
                }
            }.always { hideNetworkActivityIndicator() }
    }
    
    static func requestArticle(id: Int) -> Promise<Article> {
        
        showNetworkActivityIndicator()
        
        let url: String = Urls.getUrl(type: .item(id: id))
        
        return Alamofire.request(url)
            .responseJSON()
            .then(on: .global()) { json in
                
                return Promise { fulfill, reject in
                    if let article: Article = Article.decode(JSON(json)).value {
                        fulfill(article)
                    } else {
                        reject(CustomError.parsing)
                    }
                }
                
            }.always { hideNetworkActivityIndicator() }
    }
}

func showNetworkActivityIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
}
    
func hideNetworkActivityIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
}

