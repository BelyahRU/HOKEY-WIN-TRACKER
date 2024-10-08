
import UIKit

protocol StatisticsViewControllerDelegate:AnyObject {
    func showUI ()
    func showError()
}

class StatisticsViewController: UIViewController, StatisticsViewControllerDelegate {
    
    weak var coordinator: StatisticsCoordinator?
    let statisticsView = StatisticsView()
    var viewModel: StatisticsViewModel!
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        activityIndicator = UIActivityIndicatorView()
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel = StatisticsViewModel()
        viewModel.delegate = self
    }

    private func configure() {
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(statisticsView)
        
        statisticsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showUI() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        configure()
    }
    
    func showError() {
        //error
        coordinator?.showError()
    }
}
