
import UIKit
import SnapKit

protocol HomeViewControllerDelegate: AnyObject {
    func showUI()
}

class HomeViewController: UIViewController, UIGestureRecognizerDelegate, HomeViewControllerDelegate {
  
    weak var coordinator: HomeCoordinator?
    var homeView = HomeView()
    var viewModel: HomeViewModel!

    var cellHeights: [Bool]!
    let filterView = FilterView()
    var activityIndicator: UIActivityIndicatorView!
    var isFilterActive = false

    var errorVC = ErrorViewController()
    
    let loadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.blueColor
        setupViewModel()

    }
    
    private func setupViewModel() {
        setupLoadingView()
        viewModel = HomeViewModel()
        viewModel.delegate = self
    }
    
    func setupLoadingView() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        NotificationCenter.default.addObserver(self, selector: #selector(handleCellExpansion(_:)), name: NSNotification.Name("cellExpansionChanged"), object: nil)
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
            make.height.equalTo(460)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
        }
    }

    func showUI() {
        loadingView.removeFromSuperview()
        cellHeights = Array(repeating: false, count: viewModel.getCountEndedItems())
        
        configure()
    }
    
    func reloadUI() {
        homeView.upcomingCollectionView.reloadData()
        homeView.completedCollectionView.reloadData()
        self.view.layoutIfNeeded()
    }
    func showError() {
        self.coordinator?.showError()
    }
}
