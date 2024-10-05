
import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    var homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .orange
    }
    
    private func configure() {
        setupUI()
        setupUpcomingCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
//import Foundation
//import UIKit
//
//class HomeView: UIView {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        setupSubviews()
//        setupConstraints()
//    }
//    
//    private func setupSubviews() {
//        
//    }
//    
//    private func setupConstraints() {
//        
//    }
//}
