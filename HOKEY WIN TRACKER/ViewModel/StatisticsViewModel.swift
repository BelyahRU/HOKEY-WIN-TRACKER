
import Foundation

class StatisticsViewModel {
    
    weak var delegate: StatisticsViewController?
    
    private let khlFetcher = KHLFetcher.shared
    private(set) var top10Players: [TopPlayer] = []
    
    init() {
    
        khlFetcher.getTop10KHLPlayers { result in
            switch result {
            case .success(let players):
                self.top10Players = players
                self.delegate(isTableLoaded: true)
            case .failure:
                self.delegate(isTableLoaded: false)
            }
        }
    }
    
    public func delegate(isTableLoaded: Bool) {
        if isTableLoaded {
            DispatchQueue.main.async {
                self.delegate?.showUI()
            }
            //SHOW
//            if counter == 2 {
//                DispatchQueue.main.async {
//                    self.delegate?.showUI()
//                }
//            }
        } else {
            //ERROR
//            if !isError {
//                self.isError = true
//                DispatchQueue.main.async {
//                    self.delegate?.showError()
//                }
//            }
        }
    }
    
    //MARK: - Ended
    public func getPlayer(by id: Int) -> TopPlayer? {
        if id >= 0 && id < top10Players.count  {
            return top10Players[id]
        }
        return nil
    }
    
    public func getCountPlayers() -> Int {
        return top10Players.count
    }
    
    
}

