//
//  PresenterInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The base interface for all UX logic classes in VIPER arhitecture.
 Only methods provided by a custom presenter interface can be called from view classes.
 
 **Note:** if you want to write your own presentable view,
 please make sure you call all PresenterInterface's methods in correct moments of the view life cycle.
 */
public protocol PresenterInterface: NSObjectProtocol {
    /// Presenter should provide a reference to the view it is connected with
    var viewInterface: ViewInterface? { get set }
    
    /// Call this method to notify the presenter that the view is loaded and ready to be used
    func viewDidLoad()
    
    /// Call this method to notify the presenter that the view is about to become visible
    /// - parameter animated: if the view will appear animated
    func viewWillAppear(animated: Bool)

    /// Call this method to notify the presenter that the view has become visible
    /// - parameter animated: if appearance was animated
    func viewDidAppear(animated: Bool)
    
    /// Call this method to notify the presenter that the view is about to disappear from the screen
    /// - parameter animated: if disappearance will be animated
    func viewWillDisappear(animated: Bool)
    
    /// Call this method to notify the presenter that the view has disappeared
    /// - parameter animated: if disappearance was animated
    func viewDidDisappear(animated: Bool)
}
