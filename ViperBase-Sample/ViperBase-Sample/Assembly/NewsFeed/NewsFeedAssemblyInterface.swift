//
//  NewsFeedAssemblyInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

protocol NewsFeedAssemblyInterface: AssemblyInterface {
    func newsFeedViewController() -> NewsFeedViewController
    func articleDetailsViewController(withArticleId articleId: NewsFeedArticleId) -> ArticleDetailsViewController
}
