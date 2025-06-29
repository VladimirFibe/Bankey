import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}
class LoginViewController: UIViewController {
    weak var delegate: LoginViewControllerDelegate?
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let loginView = LoginView()
    private let signinButton = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
}

private extension LoginViewController {
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign In", for: [])
        signinButton.addTarget(self, action: #selector(handleSignIn), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    func layout() {
        [titleLabel, subtitleLabel, loginView, signinButton, errorMessageLabel].forEach { view.addSubview($0)}

        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: - Actions
private extension LoginViewController {
    @objc func handleSignIn() {
        errorMessageLabel.isHidden = true
        signinButton.configuration?.showsActivityIndicator = false
        login()
    }
    
    func login() {
        if loginView.username.isEmpty || loginView.password.isEmpty {
            configure(withMessage: "Username / Password cannot be empty")
        } else if loginView.username == "Kevin" && loginView.password == "Welcome" {
            signinButton.configuration?.showsActivityIndicator = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.loginView.reset()
                self.signinButton.configuration?.showsActivityIndicator = false
                self.delegate?.didLogin()
            }
        } else {
            configure(withMessage: "Incorrect username / password")
        }
    }
    
    func configure(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
