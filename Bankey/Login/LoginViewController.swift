import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

private extension LoginViewController {
    func style() {
        view.backgroundColor = .systemBackground
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.backgroundColor = .systemOrange
    }
    
    func layout() {
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
    }
}

