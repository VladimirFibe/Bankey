import UIKit

class LoginView: UIView {
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func setupViews() {
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
        setupStackView()
        setupUsernameTextField()
        setupDividerView()
        setupPasswordTextField()
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
    
    private func setupUsernameTextField() {
        stackView.addArrangedSubview(usernameTextField)
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
    }
    
    private func setupPasswordTextField() {
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupDividerView() {
        stackView.addArrangedSubview(dividerView)
        dividerView.backgroundColor = .secondarySystemFill
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

#Preview {
    LoginView()
}
