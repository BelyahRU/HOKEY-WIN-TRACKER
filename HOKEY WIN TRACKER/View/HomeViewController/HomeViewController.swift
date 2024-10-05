
import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    var homeView = HomeView()
    
    var cellHeights: [Bool] = Array(repeating: false, count: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(handleCellExpansion(_:)), name: NSNotification.Name("cellExpansionChanged"), object: nil)
    }
    
    @objc private func handleCellExpansion(_ notification: Notification) {
        guard let cell = notification.userInfo?["cell"] as? CompletedCollectionViewCell,
              let indexPath = homeView.completedCollectionView.indexPath(for: cell) else { return }
        
        // Изменяем состояние для конкретной ячейки
        cellHeights[indexPath.row] = cell.isExpanded
        homeView.completedCollectionView.performBatchUpdates(nil)
    }
    
    private func configure() {
        setupUI()
        setupUpcomingCollectionView()
        setupCompletedCollectionView()
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
