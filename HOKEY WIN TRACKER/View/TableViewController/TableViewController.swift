
import UIKit

protocol TableVCDelegate: AnyObject {
    func showUI()
    func showError()
}

class TableViewController: UIViewController, TableVCDelegate {
    
    weak var coordinator: TableCoordinator?
    
    let tableView = TableView()
    var viewModel: TableViewModel!
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
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        viewModel = TableViewModel()
        viewModel.delegate = self
    }
    
    public func configure() {
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func showUI() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        configure()
    }
    
    func showError() {
        //error
        coordinator?.showError()
    }
    

}

