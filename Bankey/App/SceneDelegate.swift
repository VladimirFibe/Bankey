import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let loginViewController = LoginViewController()
    let onboardingController = OnboardingContainer()
    let dummyController = DummyViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        loginViewController.delegate = self
        onboardingController.delegate = self
        dummyController.delegate = self
        window?.rootViewController = AccountSummaryViewController()
        window?.makeKeyAndVisible()
    }
    
    func setRootViewController(_ controller: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = controller
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyController)
        } else {
            setRootViewController(onboardingController)
        }
    }
}

extension SceneDelegate: OnboardingContainerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyController)
    }
}

extension SceneDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
