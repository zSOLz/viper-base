//
//  NewsFeedInteractor.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class NewsFeedInteractor: Interactor, NewsFeedInteractorInterface {
    fileprivate let newsFeedDataSession: NewsFeedDataSession
    fileprivate let newsFeedDataManager: NewsFeedDataManager
    fileprivate let detailsInteractorBuilder: ArticleDetailsInteractorBuilder
    
    init(newsFeedDataSession: NewsFeedDataSession,
         newsFeedDataManager: NewsFeedDataManager,
         detailsInteractorBuilder: ArticleDetailsInteractorBuilder) {
        self.newsFeedDataSession = newsFeedDataSession
        self.newsFeedDataManager = newsFeedDataManager
        self.detailsInteractorBuilder = detailsInteractorBuilder
    }
    
    // MARK: - NewsFeedInteractorInterface
    
    func updateArticles(success: (()->Void)?, failure: ((Error)->Void)?) {
        self.newsFeedDataManager.loadNews(success: { [weak self] articles in
            self?.newsFeedDataSession.articles = articles
            success?()
        }, failure: { error in
            failure?(error)
        })
    }
    
    var numberOfArticles: Int {
        return newsFeedDataSession.articles.count
    }
    
    func articleDetailsInteractor(withArticleId articleId: NewsFeedArticle.Id) -> ArticleDetailsInteractorInterface {
        return detailsInteractorBuilder.articleDetailsInteractor(withArticleId: articleId)
    }
}
