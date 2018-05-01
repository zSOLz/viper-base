//
//  PresentableViewController.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The base class for your custom view controller's subclasses in VIPER architecture.
 This class transfers UIViewController lifecycle methods calls to presenter class and keeps strong reference to it's UX (Presenter) class.
 */
open class PresentableViewController: UIViewController, ViewInterface, ContentContainerInterface {
    /// The strong link to class represents UX logic of your module.
    /// You can use dynamic 'as' cast to convert `PresenterInterface` to specific interface
    open var presenterInterface: PresenterInterface? {
        didSet {
            if let presenter = presenterInterface {
                presenter.viewInterface = self
                if isViewLoaded {
                    presenter.viewDidLoad()
                }
                
                if isViewVisible {
                    presenter.viewWillAppear(animated: false)
                    presenter.viewDidAppear(animated: false)
                }
            }
        }
    }
    
    fileprivate var isViewVisible: Bool {
        return (isViewLoaded && view.window != nil)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        presenterInterface?.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenterInterface?.viewWillAppear(animated: animated)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenterInterface?.viewDidAppear(animated: animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenterInterface?.viewWillDisappear(animated: animated)
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        presenterInterface?.viewDidDisappear(animated: animated)
    }

    // MARK: - ContentContainerInterface

    @objc dynamic open func setupContent() {
        // Does nothing
    }
}
