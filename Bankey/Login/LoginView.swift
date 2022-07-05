//
//  LoginView.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//


import UIKit

class LoginView: UIView {
  let usernameTextField: UITextField = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.placeholder = "Username"
    return $0
  }(UITextField())
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override var intrinsicContentSize: CGSize {
    CGSize(width: 200, height: 200)
  }
}

extension LoginView {
  func setupViews() {
    backgroundColor = .orange
    addSubview(usernameTextField)
    usernameTextField.delegate = self
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      usernameTextField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      usernameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: usernameTextField.trailingAnchor, multiplier: 1)
    ])
  }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.text != ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
