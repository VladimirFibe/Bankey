import UIKit

final class LoginView: UIView {
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let stackView = UIStackView()
    private let dividerView = UIView()
    
    var username: String {
        usernameTextField.text ?? ""
    }
    
    var password: String {
        passwordTextField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        dividerView.backgroundColor = .secondarySystemFill
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
