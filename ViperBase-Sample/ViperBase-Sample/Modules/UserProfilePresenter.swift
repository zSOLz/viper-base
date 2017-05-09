//
//  UserProfilePresenter.swift
//  ViperBase-Sample
//
//  Created by SOL on 09.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class UserProfilePresenter: Presenter {
    fileprivate let userProfileInteractor: UserProfileInteractorInterface
    
    init(router: ProfileRouterInterface, userProfileInteractor: UserProfileInteractorInterface) {
        self.userProfileInteractor = userProfileInteractor
        
        super.init(router: router)
    }
}

// MARK: - Fileprivate
fileprivate extension UserProfilePresenter {
    final var view: UserProfileViewInterface? {
        return viewInterface as? UserProfileViewInterface
    }
    
    final var router: ProfileRouterInterface? {
        return routerInterface as? ProfileRouterInterface
    }
}

// MARK: - UserProfilePresenterInterface
extension UserProfilePresenter: UserProfilePresenterInterface {
    func logoutButtonTapped() {
        userProfileInteractor.logoutUser()
        router?.showUserWelcomeScreen()
    }
}
