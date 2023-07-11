import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension LoginViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        setupLoginView()
    }
    
    private func setupLoginView() {
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
    }
}

#Preview {
    LoginViewController()
}
