import UIKit

extension UIViewController {
    func setStatusBar(frame: CGRect) {
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
