//
//  LoginView.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//


import UIKit

class LoginView: UIView {
  let stackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.spacing = 8
    return $0 }(UIStackView())
  
  let passwordTextField: UITextField = {
    $0.placeholder = "Password"
    $0.isSecureTextEntry = true
    return $0 }(UITextField())
  
  let usernameTextField: UITextField = {
    $0.placeholder = "Username"
    return $0 }(UITextField())
  
  let divederView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .secondarySystemFill
    return $0 } (UIView())
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
//  override var intrinsicContentSize: CGSize {
//    CGSize(width: 200, height: 200)
//  }
}

extension LoginView {
  func setupViews() {
    layer.cornerRadius = 5
    clipsToBounds = true
    backgroundColor = .secondarySystemBackground
    addSubview(stackView)
    stackView.addArrangedSubview(usernameTextField)
    stackView.addArrangedSubview(divederView)
    stackView.addArrangedSubview(passwordTextField)
    usernameTextField.delegate = self
    passwordTextField.delegate = self
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      divederView.heightAnchor.constraint(equalToConstant: 1),
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
      bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
    ])
  }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
      passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.text != ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
