//
//  InteractorInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The base interface for business logic classes. Represents Presenter -> Interactor bridge: use only the methods
 provided by InteractorInterface child protocols to make calls from a presenter.
 Follow the *'Single Responsibility'* design principle during the development of business logic (interactors) layer.
 */
public protocol InteractorInterface: NSObjectProtocol {
    // Empty
}
