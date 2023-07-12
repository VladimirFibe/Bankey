import UIKit

final class OnboardingViewController: UIViewController {
    let heroImageName: String
    let titleText: String
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        imageView.image = UIImage(named: heroImageName)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupLabel() {
        stackView.addArrangedSubview(label)
        label.text = titleText
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
    }
}
