import Foundation

class DateHelper {
    
    static func formatTime(from timestamp: String) -> String? {
        guard let timeInterval = TimeInterval(timestamp) else { return nil }
        
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func formatDate(from timestamp: String) -> String? {
        guard let timeInterval = TimeInterval(timestamp) else { return nil }
        
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: date)
    }
    
    static func formatUnixTime(_ unixTime: String) -> String? {
        guard let timeInterval = Double(unixTime) else {
            return nil
        }
        
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.MM.yyyy (HH:mm)"
        
        return dateFormatter.string(from: date)
    }
}
