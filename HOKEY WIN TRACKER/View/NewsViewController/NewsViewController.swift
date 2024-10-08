
import UIKit

class NewsViewController: UIViewController {
    
    weak var coordinator: NewsCoordinator?
    
    public var newsView = NewsView()
    
    var viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(newsView)
        newsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
