import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winodwScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winodwScene)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
    }
}

