//
//  ArticleDetailsInteractorBuilder.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import Foundation

protocol ArticleDetailsInteractorBuilder {
    func articleDetailsInteractor(withArticleId articleId: NewsFeedArticleId) -> ArticleDetailsInteractorInterface
}
