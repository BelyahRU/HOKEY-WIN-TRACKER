
import Foundation

struct EndedMatch: Codable {
    let id: String
    let sport_id: String
    let time: String
    let time_status: String
    let league: LeagueInfo
    let home: TeamInfo
    let away: TeamInfo
    let ss: String?
    let scores: [String: Score]
    var firstTeamImage: Data?
    var secondTeamImage: Data?
    var stadiumName: String?
}

struct EndedMatchesResponse: Codable {
    let success: Int
    let pager: Pager
    let results: [EndedMatch]
}

struct Score: Codable {
    let home: String
    let away: String
}
