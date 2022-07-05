//
//  LoginView.swift
//  Bankey
//
//  Created by Vladimir Fibe on 04.07.2022.
//


import UIKit

class LoginView: UIView {
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
  }
  
  func setupConstraints() {
    
  }
}
