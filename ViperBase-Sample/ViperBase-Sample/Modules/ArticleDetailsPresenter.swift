//
//  ArticleDetailsPresenter.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ArticleDetailsPresenter: Presenter {
    fileprivate var articleDetailsInteractor: ArticleDetailsInteractorInterface
    
    init(router: RouterInterface, articleDetailsInteractor: ArticleDetailsInteractorInterface) {
        self.articleDetailsInteractor = articleDetailsInteractor
        
        super.init(router: router)
    }
    
    override func viewDidLoad() {
        
    }
}

// MARK: - Fileprivate
fileprivate extension ArticleDetailsPresenter {
    final var view: ArticleDetailsViewInterface? {
        return viewInterface as? ArticleDetailsViewInterface
    }
    
    final var router: NewsFeedRouterInterface? {
        return routerInterface as? NewsFeedRouterInterface
    }
}

// MARK: - ArticleDetailsPresenterInterface
extension ArticleDetailsPresenter: ArticleDetailsPresenterInterface {
    func closeButtonTapped() {
        router?.closeCurrentView()
    }
}
