import SwiftUI

struct ProductCardViewApi: View {
    let imageURL: String
    let size: CGFloat

    var body: some View {
        // Load image from URL asynchronously
        AsyncImage(url: URL(string: imageURL)) { phase in
            // Handle image loading phases
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                // Once the image is loaded successfully
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            case .failure:
                // If failed to load image
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            @unknown default:
                // Handle unknown cases
                EmptyView()
            }
        }
    }
}