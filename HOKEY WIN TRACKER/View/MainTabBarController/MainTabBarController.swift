
import Foundation
import UIKit

import SnapKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    weak var coordinator: MainTabBarCoordinator?
    
    private let customTabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.blueColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        
        self.delegate = self
        
        guard let items = tabBar.items else { return }
            for item in items {
                item.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
                item.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .selected)
            }
    }
    
    private func setupSubviews() {
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    
    private func setupConstraints() {
        customTabBarView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - UITabBarControllerDelegate
   func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       updateTabBarItemsAppearance()
   }
   
   private func updateTabBarItemsAppearance() {
       guard let items = tabBar.items else { return }
       
       for item in items {
           if item == tabBar.selectedItem {
               item.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
           } else {
               item.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
           }
       }
   }
    
}
