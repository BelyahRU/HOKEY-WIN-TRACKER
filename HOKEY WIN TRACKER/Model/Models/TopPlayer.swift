
import Foundation
import UIKit

struct TopListResponse: Codable {
    let success: Int
    let results: TopResults
}

struct TopResults: Codable {
    let topgoals: [TopPlayer]
}

struct TopPlayer: Codable {
    let goal_points: String
    let goals: String
    let penalties: String
    let player: PlayerInfo
    let team: TeamInfo
    var teamImage: Data?
    
    struct PlayerInfo: Codable {
        let id: String
        let name: String
        let cc: String
    }
    
    struct TeamInfo: Codable {
        let id: String
        let name: String
        let image_id: String
        let cc: String
    }
}

