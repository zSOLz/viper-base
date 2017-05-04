//
//  NewsFeedPresenter.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class NewsFeedPresenter: Presenter {
    fileprivate let newsFeedInteractor: NewsFeedInteractorInterface
    fileprivate let detailsInteractorBuilder: ArticleDetailsInteractorBuilder
    
    init(router: NewsFeedRouterInterface,
         newsFeedInteractor: NewsFeedInteractorInterface,
         detailsInteractorBuilder: ArticleDetailsInteractorBuilder) {
        self.newsFeedInteractor = newsFeedInteractor
        self.detailsInteractorBuilder = detailsInteractorBuilder

        super.init(router: router)
    }
    
    override open func viewDidLoad() {
        newsFeedInteractor.updateArticles(success: { [weak self] in
            self?.view?.reloadNewsFeed()
        }, failure: { error in
            // TODO: Show error
        })
    }
}

// MARK: - Fileprivate
fileprivate extension NewsFeedPresenter {
    final var view: NewsFeedViewInterface? {
        return viewInterface as? NewsFeedViewInterface
    }
    
    final var router: NewsFeedRouterInterface? {
        return routerInterface as? NewsFeedRouterInterface
    }
}

// MARK: - NewsFeedPresenterInterface
extension NewsFeedPresenter: NewsFeedPresenterInterface {
    var numberOfArticles: Int {
        return newsFeedInteractor.numberOfArticles
    }
    
    func articleViewModel(at index: Int) -> NewsFeedArticleViewModel {
        let articleId = newsFeedInteractor.articleId(at: index)
        let articleDetailsInteractor = detailsInteractorBuilder.articleDetailsInteractor(withArticleId: articleId)
        var articleImage: UIImage? = nil
        if let imageName = articleDetailsInteractor.imageName {
            articleImage = UIImage(named: imageName)
        }
        let viewModel = NewsFeedArticleViewModel(title: articleDetailsInteractor.title,
                                                 image: articleImage,
                                                 author: articleDetailsInteractor.authorName)
        return viewModel
    }
    
    func articleTapped(at index: Int) {
        let articleId = newsFeedInteractor.articleId(at: index)
        router?.showArticleDetails(with: articleId)
    }
}
