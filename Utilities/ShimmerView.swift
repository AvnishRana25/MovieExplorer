import SwiftUI

/// shimmer effect loading ke liye
struct ShimmerView: View {
    let width: CGFloat
    let height: CGFloat
    
    @State private var gradientStart = UnitPoint(x: 0.0, y: 0.5)
    @State private var gradientEnd = UnitPoint(x: 1.0, y: 0.5)
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(white: 0.85), location: 0),
                            .init(color: Color(white: 0.9), location: 0.5),
                            .init(color: Color(white: 0.85), location: 1)
                        ]),
                        startPoint: gradientStart,
                        endPoint: gradientEnd
                    )
                )
                .frame(width: width, height: height)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.2)
                                    .repeatForever(autoreverses: false)) {
                        gradientStart = UnitPoint(x: 1.0, y: 0.5)
                        gradientEnd = UnitPoint(x: 0.0, y: 0.5)
                    }
                }
        }
    }
    
    init(width: CGFloat = UIScreen.main.bounds.width, height: CGFloat = 44) {
        self.width = width
        self.height = height
    }
}
