import Foundation

/// movie dikhaega with key details
struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let releaseDate: String
    let posterURL: URL?
    
}
