
import UIKit

class TableViewController: UIViewController {
    
    weak var coordinator: TableCoordinator?
    
    let tableView = TableView()
    
     let leadingTeams = ["1", "2", "3", "4", "5"]
     let outsiderTeams = ["6", "7", "8", "9", "10", "11"]


    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

}
