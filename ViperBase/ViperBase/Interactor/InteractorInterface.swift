//
//  InteractorInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Base interface for you business logic classes. Represents Presenter -> Interactor bridge: use only methods
 presented in InteractorInterface child protocols to make calls from presenter.
 Try to follow *'Single Responsibility'* design principle during develping you business logic (interactors) layer.
 */
public protocol InteractorInterface: NSObjectProtocol {
    // Empty
}
