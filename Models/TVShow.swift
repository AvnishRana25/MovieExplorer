import Foundation

/// TVshow dikhaega with the given details
struct TVShow: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let releaseDate: String
    let posterURL: URL?
    
    // Additional TV show properties can be added as needed
}
