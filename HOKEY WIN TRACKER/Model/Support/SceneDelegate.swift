
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainTabBarCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        KHLFetcher.shared.getTeamRoster(for: "2840") { result in
//            print(result)
//        }
        start()
    }
    
    func start() {
        coordinator = MainTabBarCoordinator()
        coordinator?.start()
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }

}

