import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var loginViewController = LoginViewController()
    private var onboardingController = OnboardingContainerConroller()
    private var logoutViewController = LogoutViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winodwScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winodwScene)
        loginViewController.delegate = self
        onboardingController.delegate = self
        logoutViewController.delegate = self
        setRootViewController(loginViewController, animated: false)
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboardingController)
    }
}

extension SceneDelegate: OnboardingContainerConrollerDelegate {
    func didFinishOnboarding() {
        setRootViewController(logoutViewController)
    }
}

extension SceneDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

extension SceneDelegate {
    func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard animated, let window else {
            self.window?.rootViewController = viewController
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
