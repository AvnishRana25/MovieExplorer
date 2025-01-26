import Foundation
import Combine

/// Wrapper for API responses
struct ResponseWrapper<T: Decodable>: Decodable {
    let titles: [T]
}

/// API calls to the Watchmode API
class WatchmodeAPI {
    private let apiKey = "qGo9iZuf7z2W7vEhDy4W77awNxkdEP2eQ7rxnF8x"
    private let baseURL = "https://api.watchmode.com/v1/"
    
    /// Fetches movies from Watchmode API
    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "\(baseURL)list-titles/?apiKey=\(apiKey)&type=movie&order_by=popularity")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .handleEvents(receiveOutput: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Movies Response JSON: \(jsonString)")
                }
            })
            .decode(type: ResponseWrapper<Movie>.self, decoder: JSONDecoder())
            .map(\.titles) // Use the correct key for titles array
            .eraseToAnyPublisher()
    }
    
    /// Fetches TV shows from Watchmode API
    func fetchTVShows() -> AnyPublisher<[TVShow], Error> {
        let url = URL(string: "\(baseURL)list-titles/?apiKey=\(apiKey)&type=tv_series&order_by=popularity")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .handleEvents(receiveOutput: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("TV Shows Response JSON: \(jsonString)")
                }
            })
            .decode(type: ResponseWrapper<TVShow>.self, decoder: JSONDecoder())
            .map(\.titles) // Use the correct key for titles array
            .eraseToAnyPublisher()
    }
}
