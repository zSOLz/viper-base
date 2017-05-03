//
//  NewsFeedDataSession.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import Foundation

final class NewsFeedDataSession {
    var articles = [NewsFeedArticle]()
    
    func article(withId articleId: NewsFeedArticle.Id) -> NewsFeedArticle? {
        return articles.first { $0.articleId == articleId }
    }
}
