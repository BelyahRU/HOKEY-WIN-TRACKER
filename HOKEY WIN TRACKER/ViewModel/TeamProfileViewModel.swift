
import Foundation

class TeamProfileViewModel {
    
    private let khlFetcher = KHLFetcher.shared
    
    weak var delegate: TeamProfileViewController?
    private(set) var teamRoster: [Player] = []
    
    init(teamId: String) {
        khlFetcher.getTeamRoster(for: teamId) { result in
            switch result {
            case .success(let players):
                self.teamRoster = players
                self.delegate(isError: false)
            case .failure:
                self.delegate(isError: true)
            }
        }
    }
    
    func delegate(isError: Bool) {
        if !isError {
            //show
            DispatchQueue.main.async {
                self.delegate?.showUI()
            }
        } else {
            //error
            DispatchQueue.main.async {
                self.delegate?.showError()
            }
        }
    }
    
    func getPlayer(by id: Int) -> Player? {
        if id > 0 && id < teamRoster.count {
            return teamRoster[id]
        }
        return nil
    }
    
    func getCountPlayers() -> Int {
        return teamRoster.count
    }
}
