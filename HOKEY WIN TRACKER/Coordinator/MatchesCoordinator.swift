
import Foundation
import UIKit

class MatchesCoordinator: Coordinator {
    var navigationController: UINavigationController
    var matchesVC: MatchesViewController!
    
    var parentCoordinator: MainTabBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        showMatches()
    }
    
    func showMatches() {
        matchesVC = MatchesViewController()
        matchesVC.coordinator = self
        navigationController.pushViewController(matchesVC, animated: true)
    }
    
}
