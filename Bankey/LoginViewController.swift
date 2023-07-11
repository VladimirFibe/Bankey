import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
// MARK: - Actons
extension LoginViewController {
    @objc private func signInTapped() {
        
    }
}

// MARK: - Setup Views
extension LoginViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        setupLoginView()
        setupSignInButton()
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
}

#Preview {
    LoginViewController()
}
