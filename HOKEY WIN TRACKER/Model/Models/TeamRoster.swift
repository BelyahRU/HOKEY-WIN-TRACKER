
import Foundation

struct Player: Decodable, Encodable {
    let id: String
    let name: String
    let cc: String?
    let birthdate: String?
    let position: String?
    let height: String?
    let weight: String?
    let shirtnumber: String?
    let membersince: String?
    let homeStadium: String?
    
}

// Структура для обработки основного ответа API
struct TeamRosterResponse: Decodable, Encodable {
    let success: Int
    let results: [Player]?
}
