import UIKit

final class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views
extension MainViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        let summaryController = UIViewController()
        let moneyController = DummyViewController()
        let moreController = DummyViewController()
        
        summaryController.view.backgroundColor = .red
        moneyController.view.backgroundColor = .green
        moreController.view.backgroundColor = .blue
        
        summaryController.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyController.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move money")
        moreController.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNavigation = UINavigationController(rootViewController: summaryController)
        let moneyNavigation = UINavigationController(rootViewController: moneyController)
        let moreNavigation = UINavigationController(rootViewController: moreController)
        
        summaryNavigation.navigationBar.barTintColor = .appColor
        hideNavigationBarLine(summaryNavigation.navigationBar)
        let tabBarList = [summaryNavigation, moneyNavigation, moreNavigation]
        viewControllers = tabBarList
        setupTabBar()
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let image = UIImage()
        navigationBar.shadowImage = image
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .appColor
        tabBar.isTranslucent = false
    }
}
