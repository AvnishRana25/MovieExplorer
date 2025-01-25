import Foundation
import Combine

/// data hai movies and TV shows ke liye
class MovieTVShowViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var tvShows: [TVShow] = []
    @Published var isLoading: Bool = false
    
    private let watchmodeAPI: WatchmodeAPI
    private var cancellables = Set<AnyCancellable>()
    
    init(watchmodeAPI: WatchmodeAPI = WatchmodeAPI()) {
        self.watchmodeAPI = watchmodeAPI
    }
    
    /// Fetches karta hai  movies and TV shows  Watchmode API se
    func fetchMoviesAndTVShows() {
        isLoading = true
        watchmodeAPI.fetchMovies()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
                self.isLoading = false
            }, receiveValue: { movies in
                self.movies = movies
            })
            .store(in: &cancellables)
        
        watchmodeAPI.fetchTVShows()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching TV shows: \(error)")
                }
                self.isLoading = false
            }, receiveValue: { tvShows in
                self.tvShows = tvShows
            })
            .store(in: &cancellables)
    }
}
