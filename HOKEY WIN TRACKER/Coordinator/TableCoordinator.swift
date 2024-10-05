
import Foundation
import UIKit

class TableCoordinator: Coordinator {
    var navigationController: UINavigationController
    var tableVC: TableViewController!
    
    var parentCoordinator: MainTabBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        showTable()
    }
    
    func showTable() {
        tableVC = TableViewController()
        tableVC.coordinator = self
        navigationController.pushViewController(tableVC, animated: true)
    }
    
}
