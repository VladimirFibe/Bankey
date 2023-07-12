import UIKit

final class DummyViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    weak var delegate: LogoutDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Actions
extension DummyViewController {
    @objc private func logoutButtonTapped() {
        self.delegate?.didLogout()
    }
}

// MARK: - Setup Views
extension DummyViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        setupStackView()
        setupLabel()
        setupLogoutButton()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
    
    private func setupLabel() {
        stackView.addArrangedSubview(label)
        label.text = "Welcome"
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
    }
    
    private func setupLogoutButton() {
        stackView.addArrangedSubview(logoutButton)
        logoutButton.setTitle("Log out", for: [])
        logoutButton.addTarget(self,
                               action: #selector(logoutButtonTapped),
                               for: .primaryActionTriggered)
        logoutButton.configuration = .filled()
    }
}
