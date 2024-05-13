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
            Text(item.name).font(.subheadline).fontWeight(.bold)
            
            HStack (spacing: 2) {
            Text(item.brand)
                .font(.caption)
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .background(ColorConfig.Primary.base)
                .foregroundColor(.white)
                .cornerRadius(8)
                Spacer()
                Text(item.sale)
                    .font(.body)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)

    }
}