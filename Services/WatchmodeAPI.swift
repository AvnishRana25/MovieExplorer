import Foundation
import Combine

/// API calls to the Watchmode API
/// 
class WatchmodeAPI {
    private let apiKey = "qGo9iZuf7z2W7vEhDy4W77awNxkdEP2eQ7rxnF8x"
    private let baseURL = "https://api.watchmode.com/v1/"
    
    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "\(baseURL)titles?apiKey=\(apiKey)&type=movie&order_by=popularity")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchTVShows() -> AnyPublisher<[TVShow], Error> {
        let url = URL(string: "\(baseURL)titles?apiKey=\(apiKey)&type=tv_series&order_by=popularity")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [TVShow].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
