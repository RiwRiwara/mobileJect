import SwiftUI
struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


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