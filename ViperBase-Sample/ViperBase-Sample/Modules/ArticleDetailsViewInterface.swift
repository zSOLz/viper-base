//
//  ArticleDetailsViewInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

struct ArticleDetailsViewModel {
    let title: String
    let image: UIImage?
    let author: String
    let text: String
}

protocol ArticleDetailsViewInterface: ViewInterface {
    func setup(viewModel: ArticleDetailsViewModel)
}
