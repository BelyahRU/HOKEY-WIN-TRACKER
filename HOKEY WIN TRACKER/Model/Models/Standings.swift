
import Foundation

struct TeamStanding: Codable {
    let pos: String            //position
    var team: TeamInfo         //team info
    let win: String            //count wins
    let loss: String           //loses
    let goalsfor: String       //goals
    let goalsagainst: String   //goals againts
    let points: String         //points
}

struct TeamInfo: Codable {
    let id: String
    let name: String
    let image_id: String
    var imageData: Data?
}

struct StandingsResponse: Codable {
    let success: Int
    let results: [SeasonData]
}

struct SeasonData: Codable {
    let season: SeasonInfo
    var overall: OverallData?
}

struct SeasonInfo: Codable {
    let sport_id: String
    let name: String
}

struct OverallData: Codable {
    var tables: [TableData]?
}

struct TableData: Codable {
    let name: String
    let groupname: String?
    let rows: [TeamStanding]?
}
