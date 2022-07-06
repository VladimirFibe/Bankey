//
//  ViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
  let loginView = LoginView()
  
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
    $0.text = "Error failure"
    $0.isHidden = true
    return $0 } (UILabel())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

extension LoginViewController {
  func setupViews() {
    view.addSubview(loginView)
    view.addSubview(signinButton)
    view.addSubview(errorMessageLabel)
    loginView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
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
    errorMessageLabel.isHidden.toggle()
  }
}
