
import Foundation
import UIKit

class HomeViewModel {
    
    weak var delegate: HomeViewController?
    
    private let khlFetcher = KHLFetcher.shared
    private(set) var upcomingMatches:[UpcomingMatch] = []
    private(set) var endedMatches:[EndedMatch] = []
    private(set) var filtredUpcomingMatches:[UpcomingMatch] = []
    private(set) var filtredEndedMatches:[EndedMatch] = []
    private var counter = 0
    private var isError = false
    private var isFiltered = false
    
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
        if isFiltered {
            return filtredUpcomingMatches[id]
        }
        
        return upcomingMatches[id]
    }
    
    public func getCountUpcomingItems() -> Int {
        if isFiltered {
            return filtredUpcomingMatches.count
        }
        return upcomingMatches.count
    }
    //MARK: - Ended
    public func getEndedMatch(by id: Int) -> EndedMatch {
        if isFiltered {
            return filtredEndedMatches[id]
        }
        return endedMatches[id]
    }
    public func getCountEndedItems() -> Int {
        if isFiltered {
            return filtredEndedMatches.count
        }
        return endedMatches.count
    }
    
    public func setupFilter(date: Date?, teamName: String?) {
        // Сброс фильтрованных массивов
        filtredUpcomingMatches = upcomingMatches
        filtredEndedMatches = endedMatches

        // Фильтрация по дате
        if let date = date {
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            filtredUpcomingMatches = filtredUpcomingMatches.filter { match in
                let matchDate = Date(timeIntervalSince1970: Double(match.time) ?? 0)
                return matchDate >= date
            }
            
            filtredEndedMatches = filtredEndedMatches.filter { match in
                let matchDate = Date(timeIntervalSince1970: Double(match.time) ?? 0)
                return matchDate >= date
            }
            isFiltered = true
        }
        
        // Фильтрация по названию команды
        if let teamName = teamName, !teamName.isEmpty {
            filtredUpcomingMatches = filtredUpcomingMatches.filter { match in
                return match.home.name.lowercased().contains(teamName.lowercased()) ||
                       match.away.name.lowercased().contains(teamName.lowercased())
            }
            
            filtredEndedMatches = filtredEndedMatches.filter { match in
                return match.home.name.lowercased().contains(teamName.lowercased()) ||
                       match.away.name.lowercased().contains(teamName.lowercased())
            }
            isFiltered = true
        }
        
        // Обновление UI или уведомление о фильтрации (при необходимости)
        // Например:
        self.delegate?.reloadUI()
    }
}
