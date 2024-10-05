
import UIKit
import SnapKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {
  
    weak var coordinator: HomeCoordinator?
    var homeView = HomeView()

    var cellHeights: [Bool] = Array(repeating: false, count: 20)
    let filterView = FilterView()


    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(handleCellExpansion(_:)), name: NSNotification.Name("cellExpansionChanged"), object: nil)

    }

    @objc private func handleCellExpansion(_ notification: Notification) {
        guard let cell = notification.userInfo?["cell"] as? CompletedCollectionViewCell,
              let indexPath = homeView.completedCollectionView.indexPath(for: cell) else { return }

        cellHeights[indexPath.row] = cell.isExpanded
        homeView.completedCollectionView.performBatchUpdates(nil)
    }

    private func configure() {
        setupUI()
        setupUpcomingCollectionView()
        setupCompletedCollectionView()
        setupButtons()
    }

    private func setupUI() {
        filterView.isHidden = true
        view.addSubview(homeView)
        homeView.addSubview(filterView)

        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        filterView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(440)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
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
