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
    ])
  }
}

// MARK: - Actions
extension LoginViewController {
  @objc func signInTapped(_ sender: UIButton) {
    print("tapped")
  }
}
