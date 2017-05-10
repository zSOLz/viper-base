//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import ViperBase

final class ___FILEBASENAMEASIDENTIFIER___Presenter: ___VARIABLE_presenterSubclass___ {
    init(router: ___VARIABLE_routerInterface___) {
        super.init(router: router)
    }
}

// MARK: - Fileprivate
fileprivate extension ___FILEBASENAMEASIDENTIFIER___Presenter {
    final var view: ___FILEBASENAMEASIDENTIFIER___ViewInterface? {
        return viewInterface as? ___FILEBASENAMEASIDENTIFIER___ViewInterface
    }
    
    final var router: ___VARIABLE_routerInterface___? {
        return routerInterface as? ___VARIABLE_routerInterface___
    }
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___PresenterInterface
extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___PresenterInterface {
    
}
