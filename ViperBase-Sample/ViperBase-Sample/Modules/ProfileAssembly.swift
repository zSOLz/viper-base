//
//  ProfileAssembly.swift
//  ViperBase-Sample
//
//  Created by SOL on 08.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ProfileAssembly: Assembly {
    fileprivate var userDataSession = UserDataSession()
    fileprivate weak var innerProfileRouter: ProfileRouter?
    
    func profileRouter() -> ProfileRouter {
        if let profileRouter = innerProfileRouter {
            return profileRouter
        } else {
            let profileRouter = ProfileRouter(profileAssembly: self)
            innerProfileRouter = profileRouter
            return profileRouter
        }
    }
}

extension ProfileAssembly: ProfileAssemblyInterface {
    func userWlcomeViewController() -> UserWelcomeViewController {
        let presenter = UserWelcomePresenter(router: profileRouter())
        let view = UserWelcomeViewController()
        
        view.presenterInterface = presenter
        
        return view
    }
    
    func userProfileViewController() -> UserProfileViewController {
        let interactor = UserProfileInteractor(userDataSession: userDataSession)
        let presenter = UserProfilePresenter(router: profileRouter(), userProfileInteractor: interactor)
        let view = UserProfileViewController()
        
        view.presenterInterface = presenter
        
        return view
    }
    
    func registrationRouter() -> RegistrationRouter {
        let registrationAssembly = RegistrationAssembly(userDataSession: userDataSession)
        return registrationAssembly.registrationRouter()
    }
}
