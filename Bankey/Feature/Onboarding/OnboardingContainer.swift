import UIKit

protocol OnboardingContainerDelegate: AnyObject {
    func didFinishOnboarding()
}

final class OnboardingContainer: UIViewController {
    let pageViewController: UIPageViewController
    var pages: [UIViewController] = []
    var currentPage: UIViewController {
        didSet {
            leftButton.isHidden = pages.first == currentPage
            rightButton.setTitle(pages.last == currentPage ? "Done" : "Next", for: [])
        }
    }
    let closeButton = UIButton(type: .system)
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    weak var delegate: OnboardingContainerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new lok and feel that will make you fell like you are back in 1989")
        let page2 = OnboardingViewController(heroImageName: "world", titleText: "Move yiour money around the world quickly and securely.")
        let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "Learn more at www.bankey.com.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentPage = pages[0]
        
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
// MARK: - Actions
extension OnboardingContainer {
    @objc func closeButtonTapped() {
        self.delegate?.didFinishOnboarding()
    }
    
    @objc func leftButtonTapped() {
        guard let controller = getPreviousViewController(from: currentPage) else { return }
        currentPage = controller
        pageViewController.setViewControllers([currentPage], direction: .forward, animated: false)
    }
    
    @objc func rightButtonTapped() {
        if currentPage == pages.last {
            self.delegate?.didFinishOnboarding()
        } else {
            guard let controller = getNextViewController(from: currentPage) else { return }
            currentPage = controller
            pageViewController.setViewControllers([currentPage], direction: .forward, animated: false)
        }
    }
}

// MARK: - Setup Views
extension OnboardingContainer {
    private func setupViews() {
        setupView()
        setupCloseButton()
        setupLeftButton()
        setupRightButton()
    }
    
    private func setupView() {
        view.backgroundColor = .systemPurple
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        pageViewController.setViewControllers([currentPage], direction: .forward, animated: false)
    }
    
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
    }
    
    private func setupLeftButton() {
        view.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setTitle("Previous", for: [])
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .primaryActionTriggered)
        leftButton.isHidden = true
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: leftButton.bottomAnchor, multiplier: 4)
        ])
    }
    
    private func setupRightButton() {
        view.addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setTitle("Next", for: [])
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rightButton.trailingAnchor, multiplier: 2),
            rightButton.bottomAnchor.constraint(equalTo: leftButton.bottomAnchor)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainer: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        currentPage = pages[index - 1]
        return currentPage
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentPage = pages[index + 1]
        return currentPage
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        pages.firstIndex(of: self.currentPage) ?? 0
    }
}
