
import Foundation
import UIKit

class MainTabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var mainTabBarController: MainTabBarController!
    var childCoordinators: [Coordinator] = []
    
    var homeCoordinator: HomeCoordinator!
    var newsCoordinator: NewsCoordinator!
    var statisticsCoordinator: StatisticsCoordinator!
    var tableCoordinator: TableCoordinator!
    var matchesCoordinator: MatchesCoordinator!
    
    init() {
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        showMain()
        homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        homeCoordinator.parentCoordinator = self
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        newsCoordinator = NewsCoordinator(navigationController: UINavigationController())
        newsCoordinator.parentCoordinator = self
        childCoordinators.append(newsCoordinator)
        newsCoordinator.start()

        statisticsCoordinator = StatisticsCoordinator(navigationController: UINavigationController())
        statisticsCoordinator.parentCoordinator = self
        childCoordinators.append(statisticsCoordinator)
        statisticsCoordinator.start()
        
        tableCoordinator = TableCoordinator(navigationController: UINavigationController())
        tableCoordinator.parentCoordinator = self
        childCoordinators.append(tableCoordinator)
        tableCoordinator.start()
        
        matchesCoordinator = MatchesCoordinator(navigationController: UINavigationController())
        matchesCoordinator.parentCoordinator = self
        childCoordinators.append(matchesCoordinator)
        matchesCoordinator.start()
        
        let homeImage = UIImage(named: Resources.Icons.UnselectedIcons.homeIcon)
        let newsImage = UIImage(named: Resources.Icons.UnselectedIcons.newsIcon)
        let statisticsImage = UIImage(named: Resources.Icons.UnselectedIcons.statisticsIcon)
        let tableImage = UIImage(named: Resources.Icons.UnselectedIcons.tableIcon)
        let matchesImage = UIImage(named: Resources.Icons.UnselectedIcons.matchesIcon)

        mainTabBarController.viewControllers = [
                generateNavController(for: homeCoordinator.navigationController, title: "HOME", image: homeImage),
                generateNavController(for: newsCoordinator.navigationController, title: "NEWS", image: newsImage),
                generateNavController(for: statisticsCoordinator.navigationController, title: "STATISTICS", image: statisticsImage),
                generateNavController(for: tableCoordinator.navigationController, title: "TOURNAMENT", image: tableImage),
                generateNavController(for: matchesCoordinator.navigationController, title: "MATCHES", image: matchesImage),
            ]
        
        guard let items = mainTabBarController.tabBar.items else { return }
                
                for item in items {
                    item.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
                    item.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .selected)
                }
    }
    
    func showMain() {
        mainTabBarController = MainTabBarController()
        mainTabBarController.coordinator = self
        navigationController.pushViewController(mainTabBarController, animated: true)
    }
    public func generateNavController(for navController: UINavigationController, title: String, image: UIImage?) -> UINavigationController {
        let title = title.split(separator: " ").joined(separator: "\n")
        navController.tabBarItem.title = title
        
        navController.tabBarItem.image = image

        navController.tabBarItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 6, right: 0)

        navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        

        navController.navigationBar.isHidden = true
        return navController
    }
    
}

