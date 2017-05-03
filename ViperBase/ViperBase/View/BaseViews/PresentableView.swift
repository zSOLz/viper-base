//
//  PresentableView.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class PresentableView: UIView, ViewInterface, ContentContainerInterface {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        
        setupContent()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupContent()
    }
    
    open var presenterInterface: PresenterInterface? {
        didSet {
            if let presenter = presenterInterface {
                presenter.viewInterface = self
                presenter.viewDidLoad()
                if self.superview != nil {
                    presenter.viewWillAppear(animated: false)
                    presenter.viewDidAppear(animated: false)
                }
            }
        }
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        if newSuperview != nil {
            presenterInterface?.viewWillAppear(animated: false)
        } else {
            presenterInterface?.viewWillDisappear(animated: false)
        }
    }
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if superview != nil {
            presenterInterface?.viewDidAppear(animated: false)
        } else {
            presenterInterface?.viewDidDisappear(animated: false)
        }
    }
    
    // MARK: - ContentContainerInterface
    
    open func setupContent() {
        // Does nothing
    }
}
