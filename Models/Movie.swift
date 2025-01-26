import Foundation

/// movie dikhaega with key details
struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let year: Int
    let imdb_id: String?
    let tmdb_id: Int?
    let tmdb_type: String?
    let type: String?
    let posterPath: String?
    let overview: String // Add this line for movie description

    // Computed property to create the poster URL
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}
