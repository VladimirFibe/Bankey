//
//  ViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Bankey"
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .largeTitle)
    return $0 } (UILabel())
  
  let subtitleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.numberOfLines = 0
    $0.textAlignment = .center
    $0.text = "You premium source fo all things banking!"
    return $0 } (UILabel())
  
  let loginView: LoginView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0 } (LoginView())
  
  lazy var signinButton: UIButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.configuration = .filled()
    $0.configuration?.imagePadding = 8
    $0.setTitle("Sign In", for: [])
    $0.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    return $0 } (UIButton(type: .system))
  
  let errorMessageLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textAlignment = .center
    $0.textColor = .systemRed
    $0.numberOfLines = 0
    $0.isHidden = true
    return $0 } (UILabel())
  
  var username: String? {
    loginView.usernameTextField.text
  }
  
  var password: String? {
    loginView.passwordTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

extension LoginViewController {
  
  func setupViews() {
    view.addSubview(titleLabel)
    view.addSubview(subtitleLabel)
    view.addSubview(loginView)
    view.addSubview(signinButton)
    view.addSubview(errorMessageLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      
      subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
      titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
      
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 2),
      subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
      
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
      
      signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
      signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
      
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
    ])
  }
}

// MARK: - Actions
extension LoginViewController {
  @objc func signInTapped(_ sender: UIButton) {
    errorMessageLabel.isHidden = true
    login()
  }
  
  private func login() {
    guard let username = username, let password = password else {
      assertionFailure("Username / password should never be nil")
      return
    }
    if username.isEmpty || password.isEmpty {
      configureView(withMessage: "Username / password cannot be blank")
    } else if username.lowercased() == "kevin" && password == "welcome" {
      signinButton.configuration?.showsActivityIndicator = true
    } else {
      configureView(withMessage: "Incorrect username / password")
    }
  }
  
  private func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
}
