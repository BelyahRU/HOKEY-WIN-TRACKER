
import Foundation
import UIKit

class StatisticsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var statisticsVC: StatisticsViewController!
    
    var parentCoordinator: MainTabBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        showStatistics()
    }
    
    func showStatistics() {
        statisticsVC = StatisticsViewController()
        statisticsVC.coordinator = self
        navigationController.pushViewController(statisticsVC, animated: true)
    }
    
    func showError() {
        parentCoordinator?.showError()
    }
    
}
