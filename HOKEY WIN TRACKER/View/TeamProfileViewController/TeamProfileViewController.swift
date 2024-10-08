
import Foundation
import UIKit

protocol TeamProfileViewControllerDelegate: AnyObject {
    func showUI()
    func showError()
}

class TeamProfileViewController: UIViewController, TeamProfileViewControllerDelegate {
    
    let teamProfileView = TeamProfileView()
    var activityIndicator = UIActivityIndicatorView()
    var viewModel: TeamProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configure()
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
    }
    
    private func setupViewModel(_ team: TeamStanding) {
        viewModel = TeamProfileViewModel(teamId: team.team.id)
        viewModel.delegate = self
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
    
    public func setupTeam(_ team: TeamStanding) {
        teamProfileView.points.text = team.points
        teamProfileView.victories.text = team.win
        teamProfileView.defeats.text = team.loss
        
        teamProfileView.teamNameLabel.text = team.team.name
        teamProfileView.teamLogo.image = UIImage(data: team.team.imageData ?? Data())
        
        
        setupViewModel(team)
    }
    
    
    func showUI() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        configure()
    }
    
    func showError() {
        //error
    }
    
}
