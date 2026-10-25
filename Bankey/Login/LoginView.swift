import UIKit

final class LoginView: UIView {
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func style() {
        layer.cornerRadius = 5
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        setupStackView()
        setupUsernameTextField()
        setupDividerView()
        setupPasswordTextField()
    }
    
    func layout() {
        
    }
    
    func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
    
    func setupUsernameTextField() {
        stackView.addArrangedSubview(usernameTextField)
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
    }
    
    func setupPasswordTextField() {
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
     }
    
    func setupDividerView() {
        stackView.addArrangedSubview(dividerView)
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerView.backgroundColor = .secondarySystemFill
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.text != ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
