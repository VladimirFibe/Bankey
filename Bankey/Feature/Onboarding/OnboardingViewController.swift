import UIKit

class OnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension OnboardingViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        setupStackView()
        setupImageView()
        setupLabel()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.image = UIImage(resource: .delorean)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupLabel() {
        stackView.addArrangedSubview(label)
        label.text = "Bankey is faster, easier to use, and has a brand new lok and feel that will make you fell like you are back in 1989"
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
    }
}
