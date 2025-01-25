import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: movie.posterURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            } placeholder: {
                ShimmerView(width: 100, height: 150)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(movie.description)
                    .font(.body)
                    .lineLimit(3)
                
                Text("Release Date: \(movie.releaseDate)")
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
    }
}
