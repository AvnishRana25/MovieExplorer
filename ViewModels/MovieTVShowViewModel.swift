import Foundation
import Combine

class MovieTVShowViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var tvShows: [TVShow] = []
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    private let watchmodeAPI = WatchmodeAPI()
    
    func fetchMoviesAndTVShows() {
        isLoading = true
        
        // Fetch movies
        watchmodeAPI.fetchMovies()
            .receive(on: DispatchQueue.main) // Dispatch updates to the main thread
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
        
        // Fetch TV shows
        watchmodeAPI.fetchTVShows()
            .receive(on: DispatchQueue.main) // Dispatch updates to the main thread
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
