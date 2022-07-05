//
//  ViewController.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
  let loginView = LoginView()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

extension LoginViewController {
  func setupViews() {
    view.addSubview(loginView)
    loginView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  func setupConstraints() {
    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
    ])
  }
}

