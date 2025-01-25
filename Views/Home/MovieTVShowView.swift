import SwiftUI
struct MovieTVShowView: View {
    @StateObject private var viewModel = MovieTVShowViewModel()
    @State private var showingMovies = true

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Movies/TV Shows", isOn: $showingMovies)
                    .padding()

                if viewModel.isLoading {
                    ShimmerView()
                } else {
                    List {
                        if showingMovies {
                            ForEach(viewModel.movies) { movie in
                                NavigationLink(destination: DetailView(item: movie)) {
                                    MovieItemView(movie: movie)
                                }
                            }
                        } else {
                            ForEach(viewModel.tvShows) { tvShow in
                                NavigationLink(destination: DetailView(item: tvShow)) {
                                    TVShowItemView(tvShow: tvShow)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Movies & TV Shows")
            .onAppear {
                viewModel.fetchMoviesAndTVShows()
            }
        }
    }
}

struct MovieTVShowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVShowView()
    }
}

/// A generic view that displays the details for either a movie or a TV show.
struct DetailView: View {
    let item: any Identifiable

    var body: some View {
        if let movie = item as? Movie {
            MovieDetailView(movie: movie)
        } else if let tvShow = item as? TVShow {
            TVShowDetailView(tvShow: tvShow)
        } else {
            Text("Invalid item")
        }
    }
}
