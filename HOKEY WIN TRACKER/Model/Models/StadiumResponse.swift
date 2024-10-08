
import Foundation
struct StadiumResponse: Decodable {
    let success: Int
    let results: [Event]
    
    struct Event: Decodable {
        let extra: Extra?
        
        struct Extra: Decodable {
            let stadium_data: StadiumData?
            
            struct StadiumData: Decodable {
                let name: String
            }
        }
    }
}
