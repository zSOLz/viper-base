//
//  PresentableNavigationController.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class PresentableNavigationController: UINavigationController, ViewInterface {
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
    
    dynamic open func setupContent() {
        // Does nothing
    }
}
