import SwiftUI
struct TVShowItemView: View {
    let tvShow: TVShow
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: tvShow.posterURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            } placeholder: {
                ShimmerView(width: 100, height: 150)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(tvShow.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(tvShow.description)
                    .font(.body)
                    .lineLimit(3)
                
                Text("Release Date: \(tvShow.releaseDate)")
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
    }
}
