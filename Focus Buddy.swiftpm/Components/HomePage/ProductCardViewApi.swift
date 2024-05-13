import SwiftUI

struct ProductCardViewApi: View {
    let size: CGFloat
    let item: Item

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.img)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: size, height: 200 * (size/210))
                        .cornerRadius(20.0)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)
                @unknown default:
                    EmptyView()
                }
            }
            Text(item.name).font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text(item.sale)
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