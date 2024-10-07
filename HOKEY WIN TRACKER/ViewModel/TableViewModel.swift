
import Foundation
import UIKit

class TableViewModel {
    
    weak var delegate: TableViewController?
    
    private let khlCaller = KHLAPI.shared
    private(set) var teamsArray:[TeamStanding] = []
    
    init() {
        khlCaller.fetchStandings { result in
            switch result {
            case .success(let standings):
                print("Турнирная таблица КХЛ:")
                self.teamsArray = standings
                self.delegate(isTableLoaded: true)
            case .failure(let error):
                print("Ошибка загрузки турнирной таблицы: \(error)")
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
        print(teamsArray.count)
        print(id)
        return teamsArray[id]
    }
    
    public func getCountItems() -> Int {
        return teamsArray.count
    }

}
