import UIKit

extension UIViewController {
    func setStatusBar() {
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let width = view.bounds.width
        let statusBarSize = CGSize(width: width, height: height)
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)
        statusbarView.backgroundColor = .appColor
        view.addSubview(statusbarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
