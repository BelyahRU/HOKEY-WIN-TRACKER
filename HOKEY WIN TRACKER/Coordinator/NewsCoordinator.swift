
import Foundation
import UIKit

class NewsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var newsVC: NewsViewController!
    
    var parentCoordinator: MainTabBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        showNews()
    }
    
    func showNews() {
        newsVC = NewsViewController()
        newsVC.coordinator = self
        navigationController.pushViewController(newsVC, animated: true)
    }
    
}
