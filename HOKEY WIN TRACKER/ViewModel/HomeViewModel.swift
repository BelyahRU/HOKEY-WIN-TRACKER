
import Foundation
import UIKit

class HomeViewModel {
    
    weak var delegate: HomeViewController?
    
    private let khlFetcher = KHLFetcher.shared
    private(set) var upcomingMatches:[UpcomingMatch] = []
    private(set) var endedMatches:[EndedMatch] = []
    private var counter = 0
    private var isError = false
    
    init() {
        khlFetcher.getUpcomingMatches { result in
            switch result {
            case .success(let upcomingMatches):
                self.upcomingMatches = upcomingMatches
                self.counter += 1
                self.delegate(isTableLoaded: true)
            case .failure:
                self.delegate(isTableLoaded: false)
            }
        }
        
        khlFetcher.getEndedMatches  { result in
            switch result {
            case .success(let endedMatches):
                self.counter += 1
                self.endedMatches = endedMatches
                self.delegate(isTableLoaded: true)
            case .failure:
                self.delegate(isTableLoaded: false)
            }
        }
    }
    
    public func delegate(isTableLoaded: Bool) {
        if isTableLoaded {
            //SHOW
            if counter == 2 {
                DispatchQueue.main.async {
                    self.delegate?.showUI()
                }
            }
        } else {
            //ERROR
            if !isError {
                self.isError = true
                DispatchQueue.main.async {
                    self.delegate?.showError()
                }
            }
        }
    }
    //MARK: - Upcoming
    public func getUpcomingMatch(by id: Int) -> UpcomingMatch {
        return upcomingMatches[id]
    }
    
    public func getCountUpcomingItems() -> Int {
        return upcomingMatches.count
    }
    //MARK: - Ended
    public func getEndedMatch(by id: Int) -> EndedMatch {
        return endedMatches[id]
    }
    public func getCountEndedItems() -> Int {
        return upcomingMatches.count
    }

}
