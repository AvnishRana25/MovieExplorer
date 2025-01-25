import SwiftUI

/// tv show ka detailed view dikhaega.
struct TVShowDetailView: View {
    let tvShow: TVShow
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: tvShow.posterURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ShimmerView()
                }
                
                Text(tvShow.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(tvShow.description)
                    .font(.body)
                
                Text("Release Date: \(tvShow.releaseDate)")
                    .font(.subheadline)
            }
            .padding()
        }
    }
}
