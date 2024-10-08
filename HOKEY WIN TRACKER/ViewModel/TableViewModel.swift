
import Foundation
import UIKit

class TableViewModel {
    
    weak var delegate: TableViewController?
    
    private let khlFetcher = KHLFetcher.shared
    private(set) var teamsArray:[TeamStanding] = []
    
    init() {
        khlFetcher.getKHLTable { result in
            switch result {
            case .success(let standings):
                self.teamsArray = standings
                self.delegate(isTableLoaded: true)
            case .failure(let error):
                self.delegate(isTableLoaded: false)
            }
        }
    }
    
    public func delegate(isTableLoaded: Bool) {
        if isTableLoaded {
            //SHOW
            DispatchQueue.main.async {
                self.delegate?.showUI()
            }
        } else {
            //ERROR
        }
    }
    
    public func getTeam(by id: Int) -> TeamStanding {
        return teamsArray[id]
    }
    
    public func getCountItems() -> Int {
        return teamsArray.count
    }

}
