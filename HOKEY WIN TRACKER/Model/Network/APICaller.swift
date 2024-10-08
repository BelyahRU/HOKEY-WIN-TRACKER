import Foundation

// Ошибки API
enum APIError: Error {
    case invalidURL
    case noData
    case decodingFailed(Error)
    case serverError(String)
}

// Главный класс для взаимодействия с API
class APICaller {

    static let shared = APICaller()

    private init() {}
    
    func performRequest<T: Codable>(urlString: String, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }

            guard let data = data else {
                print("no data")
                completion(.failure(.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(responseType, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(.decodingFailed(error)))
            }
        }
        task.resume()
    }

}
