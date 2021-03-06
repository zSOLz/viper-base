//
//  NewsFeedDataSession.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class NewsFeedDataSession {
    var articles = [NewsFeedArticle]()
    
    func article(withId articleId: NewsFeedArticleId) -> NewsFeedArticle? {
        return articles.first { $0.articleId == articleId }
    }
}
