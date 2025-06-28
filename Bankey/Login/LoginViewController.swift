import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        style()
        layout()
    }
}

private extension LoginViewController {
    func style() {
        
    }
    
    func layout() {
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

