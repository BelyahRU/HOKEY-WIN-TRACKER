
import Foundation
import UIKit

class TeamProfileViewController: UIViewController {
    
    let teamProfileView = TeamProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupUI()
        setupCollectionView()
        setupButtons()
    }
    
    private func setupUI() {
        view.addSubview(teamProfileView)
        
        teamProfileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
