
import Foundation

class KHLFetcher {
    
    static let shared = KHLFetcher()
    
    private let apiCaller = APICaller.shared
    
    private let token = NetworkConstants.token
    private let baseURL = "https://api.b365api.com/v3"
    private let league_id = "128" //KHL
    private let sport_id = "17" //Ice hockey
//https://api.b365api.com/v1/league/toplist?token=204037-oqW58jK8v0i1Sx&league_id=128
    private init() { }
    
    //MARK: - UPCOMING
    func getUpcomingMatches(completion: @escaping (Result<[UpcomingMatch], APIError>) -> Void) {
        let urlString = "\(baseURL)/events/upcoming?sport_id=\(sport_id)&token=\(token)&league_id=\(league_id)"
        apiCaller.performRequest(urlString: urlString, responseType: UpcomingMatchesResponse.self) { result in
            switch result {
            case .success(let matchesResponse):
                var sortedMatches = matchesResponse.results.sorted { match1, match2 in
                    guard let time1 = Double(match1.time), let time2 = Double(match2.time) else { return false }
                    return time1 < time2
                }
                let dispatchGroup = DispatchGroup()
                for i in 0..<sortedMatches.count {
                    let image_id1 = sortedMatches[i].home.image_id
                    let image_id2 = sortedMatches[i].away.image_id
                    
                    dispatchGroup.enter()
                    self.loadImage(for: image_id1) { result in
                        switch result {
                        case .success(let imageData):
                            sortedMatches[i].firstTeamImage = imageData
                        case .failure(let error):
                            print("Не удалось загрузить изображение для команды \(image_id1): \(error)")
                        }
                        dispatchGroup.leave()
                    }

                    
                    dispatchGroup.enter()
                    self.loadImage(for: image_id2) { result in
                        switch result {
                        case .success(let imageData):
                            sortedMatches[i].secondTeamImage = imageData
                        case .failure(let error):
                            print("Не удалось загрузить изображение для команды \(image_id2): \(error)")
                        }
                        dispatchGroup.leave()
                    }
                }
                dispatchGroup.notify(queue: .main) {
                    completion(.success(sortedMatches))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getEndedMatches(completion: @escaping (Result<[EndedMatch], APIError>) -> Void) {
            let urlString = "\(baseURL)/events/ended?sport_id=\(sport_id)&token=\(token)&league_id=\(league_id)"
            
            // Выполнение запроса
            apiCaller.performRequest(urlString: urlString, responseType: EndedMatchesResponse.self) { result in
                switch result {
                case .success(let matchesResponse):
                    var sortedMatches = matchesResponse.results.sorted { match1, match2 in
                        guard let time1 = Double(match1.time), let time2 = Double(match2.time) else { return false }
                        return time1 > time2
                    }
                    
                    let dispatchGroup = DispatchGroup()
                    for i in 0..<sortedMatches.count {
                        let image_id1 = sortedMatches[i].home.image_id
                        let image_id2 = sortedMatches[i].away.image_id
                        
                        dispatchGroup.enter()
                        self.loadImage(for: image_id1) { result in
                            switch result {
                            case .success(let imageData):
                                sortedMatches[i].firstTeamImage = imageData
                            case .failure(let error):
                                print("Не удалось загрузить изображение для команды \(image_id1): \(error)")
                            }
                            dispatchGroup.leave()
                        }

                        dispatchGroup.enter()
                        self.loadImage(for: image_id2) { result in
                            switch result {
                            case .success(let imageData):
                                sortedMatches[i].secondTeamImage = imageData
                            case .failure(let error):
                                print("Не удалось загрузить изображение для команды \(image_id2): \(error)")
                            }
                            dispatchGroup.leave()
                        }
                    }
                    
                    dispatchGroup.notify(queue: .main) {
                        completion(.success(sortedMatches))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    //MARK: - TABLE
    func getKHLTable(completion: @escaping (Result<[TeamStanding], APIError>) -> Void) {
        let urlString = "\(baseURL)/league/table?token=\(NetworkConstants.token)&league_id=\(league_id)"
        apiCaller.performRequest(urlString: urlString, responseType: StandingsResponse.self) { result in
            switch result {
            case .success(let standingsResponse):
                guard let tables = standingsResponse.results.first?.overall?.tables else {
                    completion(.failure(.noData))
                    return
                }
                
                let filteredTables = tables.filter { $0.groupname == nil }
                var rows = filteredTables.compactMap { $0.rows }.flatMap { $0 }

                let dispatchGroup = DispatchGroup()
                
                for i in 0..<rows.count {
                    let image_id = rows[i].team.image_id
                    dispatchGroup.enter()
                    
                    self.loadImage(for: image_id) { result in
                        switch result {
                        case .success(let imageData):
                            rows[i].team.imageData = imageData
                        case .failure(let error):
                            print("Не удалось загрузить изображение для команды \(image_id): \(error)")
                        }
                        
                        dispatchGroup.leave()
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    completion(.success(rows))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(for teamID: String, completion: @escaping (Result<Data, APIError>) -> Void) {
    
        guard let imageURL = URL(string: "https://assets.b365api.com/images/team/m/\(teamID).png") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
