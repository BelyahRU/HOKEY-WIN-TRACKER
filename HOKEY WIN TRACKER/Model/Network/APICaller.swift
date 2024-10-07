import Foundation

// Ошибки API
enum APIError: Error {
    case invalidURL
    case noData
    case decodingFailed(Error)
    case serverError(String)
}

// Структура для хранения данных о команде
struct TeamStanding: Codable {
    let pos: String            // Позиция в таблице
    var team: TeamInfo         // Информация о команде
    let win: String            // Количество побед
    let loss: String           // Количество поражений
    let goalsfor: String       // Количество заброшенных шайб
    let goalsagainst: String   // Количество пропущенных шайб
    let points: String         // Количество очков
}

// Структура для информации о команде
// Структура для информации о команде
struct TeamInfo: Codable {
    let id: String             // Идентификатор команды
    let name: String           // Название команды
    let image_id: String// URL изображения команды
    var imageData: Data?
}

// Структура для всего ответа API
struct StandingsResponse: Codable {
    let success: Int
    let results: [SeasonData]
}

// Структура для данных по сезону
struct SeasonData: Codable {
    let season: SeasonInfo
    var overall: OverallData?
}

// Структура для информации о сезоне
struct SeasonInfo: Codable {
    let sport_id: String
    let name: String
}

// Структура для данных по конференциям и таблицам
struct OverallData: Codable {
    var tables: [TableData]?
}

// Структура для таблиц, например, Западная Конференция
struct TableData: Codable {
    let name: String
    let groupname: String?
    let rows: [TeamStanding]?  // Список команд и их позиций
}
// Главный класс для взаимодействия с API
class KHLAPI {
    private let baseURL = "https://api.b365api.com/v3/"
    private let token: String = NetworkConstants.token

    static let shared = KHLAPI()

    private init() {}

    func fetchStandings(completion: @escaping (Result<[TeamStanding], APIError>) -> Void) {
        let urlString = "\(baseURL)league/table?token=\(token)&league_id=128"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let standingsResponse = try decoder.decode(StandingsResponse.self, from: data)

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

            }  catch {
                completion(.failure(.decodingFailed(error)))
            }
        }

        task.resume()
    }
    
        func loadImage(for teamID: String, completion: @escaping (Result<Data, APIError>) -> Void) {
            // Формирование URL-адреса для изображения
            guard let imageURL = URL(string: "https://assets.b365api.com/images/team/m/\(teamID).png") else {
                completion(.failure(.invalidURL))
                return
            }
            print(imageURL)
            
            // Выполнение запроса для загрузки изображения
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
