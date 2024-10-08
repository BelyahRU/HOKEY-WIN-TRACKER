
import Foundation

struct UpcomingMatch: Codable {
    let id: String
    let sport_id: String
    let time: String
    let time_status: String
    let league: LeagueInfo
    let home: TeamInfo
    let away: TeamInfo
    let ss: String?
    var firstTeamImage: Data?
    var secondTeamImage: Data?
    var stadiumName: String?
}

struct UpcomingMatchesResponse: Codable {
    let success: Int
    let pager: Pager?           
    let results: [UpcomingMatch]
}
