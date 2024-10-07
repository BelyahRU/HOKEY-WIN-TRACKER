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
    let team: TeamInfo         // Информация о команде
    let win: String            // Количество побед
    let loss: String           // Количество поражений
    let goalsfor: String       // Количество заброшенных шайб
    let goalsagainst: String   // Количество пропущенных шайб
    let points: String         // Количество очков
}

// Структура для информации о команде
struct TeamInfo: Codable {
    let id: String             // Идентификатор команды
    let name: String           // Название команды
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

    // Функция для получения турнирной таблицы
    func fetchStandings(completion: @escaping (Result<[TeamStanding], APIError>) -> Void) {
        let urlString = "\(baseURL)league/table?token=\(token)&league_id=128"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Проверка на наличие ошибки
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }

            // Проверка на наличие данных
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let standingsResponse = try decoder.decode(StandingsResponse.self, from: data)

                // Проверка на наличие таблиц в данных сезона
                guard let tables = standingsResponse.results.first?.overall?.tables else {
                    completion(.failure(.noData))
                    return
                }

                // Фильтрация таблиц, где groupname == nil
                let filteredTables = tables.filter { $0.groupname == nil }

                // Извлечение строк из отфильтрованных таблиц
                let rows = filteredTables.compactMap { $0.rows }.flatMap { $0 }

                completion(.success(rows))
            }  catch {
                completion(.failure(.decodingFailed(error)))
            }
        }

        task.resume()
    }
}
