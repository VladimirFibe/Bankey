import UIKit

class LoginViewController: UIViewController {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
// MARK: - Actons
extension LoginViewController {
    @objc private func signInTapped() {
        errorMessageLabel.isHidden = true
        signInButton.configuration?.showsActivityIndicator = false
        login()
    }
    
    private func login() {
        guard let username, let password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configure(withMessage: "Username / password cannot be blank")
        } else if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configure(withMessage: "Incorrect username / password")
        }
    }
    
    private func configure(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}

// MARK: - Setup Views
extension LoginViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        setupLoginView()
        setupSignInButton()
        setupErrorMessageLabel()
        setupSubtitleLabel()
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
    
    private func setupSubtitleLabel() {
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.text = "Your premium source for all things banking!"
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    
    private func setupLoginView() {
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
    }
    
    private func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    
    private func setupErrorMessageLabel() {
        view.addSubview(errorMessageLabel)
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

#Preview {
    LoginViewController()
}
