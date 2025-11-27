import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let loginButton = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

private extension LoginViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.configuration?.imagePadding = 8
        loginButton.setTitle("Sign In", for: [])
        loginButton.addTarget(self, action: #selector(loginTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        errorMessageLabel.numberOfLines = 0
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            
            // LoginView
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // LoginButton
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // ErrorMessage
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

@objc private extension LoginViewController {
    func loginTapped() {
        errorMessageLabel.text = "Error"
        errorMessageLabel.isHidden = false
    }
}
