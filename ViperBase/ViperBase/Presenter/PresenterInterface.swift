//
//  PresenterInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Base interface for all UX logic classes in VIPER arhitecture.
 Only methods from your custom presenter interface can be called from view classe.
 
 **Note:** if you want to write your own presentable view,
 please make sure you call all PresenterInterface's methods in correct moments of view life cycle.
 */
public protocol PresenterInterface: NSObjectProtocol {
    /// Presenter should provide reference view it connected with
    var viewInterface: ViewInterface? { get set }
    
    /// Call this method to notify presenter that all view interface is loaded ready to use
    func viewDidLoad()
    
    /// Call this method to notify presenter that view is about to become visible
    /// - parameter animated: is appearance will be animated
    func viewWillAppear(animated: Bool)

    /// Call this method to notify presenter that view did become visible
    /// - parameter animated: is appearance was animated
    func viewDidAppear(animated: Bool)
    
    /// Call this method to notify presenter that view is about to disappear on screen
    /// - parameter animated: is disappearance will be animated
    func viewWillDisappear(animated: Bool)
    
    /// Call this method to notify presenter that view did disappear
    /// - parameter animated: is disappearance was animated
    func viewDidDisappear(animated: Bool)
}
