//
//  ProfileRouter.swift
//  ViperBase-Sample
//
//  Created by SOL on 08.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ProfileRouter: StackRouter {
    let profileAssembly: ProfileAssemblyInterface
    
    init(profileAssembly: ProfileAssemblyInterface) {
        self.profileAssembly = profileAssembly
    }
    
    override func loadNavigationController() {
        super.loadNavigationController()
        
        showUserWelcomeScreen()
    }
}

// MARK: - ProfileRouterInterface
extension ProfileRouter: ProfileRouterInterface {
    func showUserProfileScreen() {
        navigationController.viewControllers = [profileAssembly.userProfileViewController()]
    }
    
    func showUserWelcomeScreen() {
        navigationController.viewControllers = [profileAssembly.userWlcomeViewController()]
    }
    
    func showRegistrationScreen() {
        let registrationRouter = profileAssembly.registrationRouter()
        
        registrationRouter.completionClosure = { [weak self, weak registrationRouter] in
            self?.showUserProfileScreen()
            self?.baseViewController.dismiss(animated: true)
            
            // Do not forget to remove child routers
            registrationRouter?.removeFromParent()
        }
        
        registrationRouter.cancelClosure = { [weak self, weak registrationRouter] in
            self?.baseViewController.dismiss(animated: true)
            
            // Do not forget to remove child routers
            registrationRouter?.removeFromParent()
        }
        
        // Add router as child to keep strong reference
        addChild(router: registrationRouter)
        baseViewController.present(registrationRouter.baseViewController, animated: true)
    }
}
