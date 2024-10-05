
import UIKit

class StatisticsViewController: UIViewController {
    
    weak var coordinator: StatisticsCoordinator?
    let statisticsView = StatisticsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
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
}
