//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import ViperBase

final class ___VARIABLE_productName___Presenter: ___VARIABLE_presenterSubclass___ {
    init(router: ___VARIABLE_routerInterface___) {
        super.init(router: router)
    }
}

// MARK: - Fileprivate
fileprivate extension ___VARIABLE_productName___Presenter {
    final var view: ___VARIABLE_productName___ViewInterface? {
        return viewInterface as? ___VARIABLE_productName___ViewInterface
    }
    
    final var router: ___VARIABLE_routerInterface___? {
        return routerInterface as? ___VARIABLE_routerInterface___
    }
}

// MARK: - ___VARIABLE_productName___PresenterInterface
extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___PresenterInterface {
    // Empty
}
