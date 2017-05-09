//
//  UserWelcomePresenter.swift
//  ViperBase-Sample
//
//  Created by SOL on 09.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class UserWelcomePresenter: Presenter {
    init(router: ProfileRouterInterface) {
        // TODO: Implement
        super.init(router: router)
    }
}

// MARK: - Fileprivate
fileprivate extension UserWelcomePresenter {
    final var view: UserWelcomeViewInterface? {
        return viewInterface as? UserWelcomeViewInterface
    }
    
    final var router: ProfileRouterInterface? {
        return routerInterface as? ProfileRouterInterface
    }
}

// MARK: - UserWelcomePresenterInterface
extension UserWelcomePresenter: UserWelcomePresenterInterface {
    func registerButtonTapped() {
        router?.showRegistrationScreen()
    }
}
