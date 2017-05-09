//
//  RegistrationCredentialsViewController.swift
//  ViperBase-Sample
//
//  Created by SOL on 09.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class RegistrationCredentialsViewController: PresentableViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var repeatPasswordErrorLabel: UILabel!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var activityIndicatorView: UIView!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        presenter?.submitButtonTapped()
    }
    
    @IBAction func usernameTextChanged(_ sender: Any) {
        presenter?.usernameChanged(usernameTextField.text ?? "")
    }
    
    @IBAction func passwordTextChanged(_ sender: Any) {
        presenter?.passwordChanged(passwordTextField.text ?? "")
    }
    
    @IBAction func repeatPasswordTextChanged(_ sender: Any) {
        presenter?.repeatPasswordChanged(repeatPasswordTextField.text ?? "")
    }
}

// MARK: - Fileprivate
fileprivate extension RegistrationCredentialsViewController {
    final var presenter: RegistrationCredentialsPresenterInterface? {
        return presenterInterface as? RegistrationCredentialsPresenterInterface
    }
}

// MARK: - RegistrationCredentialsViewInterface
extension RegistrationCredentialsViewController: RegistrationCredentialsViewInterface {
    func setSubmitButton(enabled isEnabled: Bool) {
        submitButton.isEnabled = isEnabled
    }
    
    func setSetRepeatPasswordError(hidden isHidden: Bool) {
        repeatPasswordErrorLabel.isHidden = isHidden
    }
    
    func setActivityIndicator(visible: Bool) {
        if visible {
            activityIndicatorView.alpha = 0
            view.addSubview(activityIndicatorView)
            activityIndicatorView.frame = view.bounds
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.activityIndicatorView.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.activityIndicatorView.alpha = 0
            }, completion: { [weak self] isCompleted in
                self?.activityIndicatorView.removeFromSuperview()
            })
        }
    }
}

// MARK: - ContentContainerInterface
extension RegistrationCredentialsViewController {
    override func setupContent() {
        super.setupContent()
        
        title = "Registration: Credentials"
    }
}
