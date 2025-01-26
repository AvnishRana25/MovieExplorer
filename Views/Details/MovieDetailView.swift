import SwiftUI

/// movie ka detailed view dikhaega.
struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ShimmerView()
                }
                
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(movie.overview)
                    .font(.body)
                
                Text("Release Date: \(movie.year)")
                    .font(.subheadline)
            }
            .padding()
        }
    }
}
