
import SwiftUI
struct DescriptionView: View {
    let item: Item

    var body: some View {
        VStack (alignment: .leading) {
            //Title
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(ColorConfig.Primary.base)

            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(
                item.description ?? "No description available"
            )
                .lineSpacing(8.0)
                .opacity(0.6)

            Text(item.brand ?? "")
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                    .background(ColorConfig.Primary.base)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()
                    
     
            VStack(alignment: .leading, spacing: 10) {
                Text("Suggested Items")
                    .padding(.top, 10)
                    .padding(.horizontal, -15)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)

                HStack {
                    ForEach(0..<4) { index in
                        Button(action: {
                            // Open the URL in browser when clicked
                            if let urlString = destinationURL(for: index) {
                                if let url = URL(string: urlString) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }) {
                            AsyncImage(url: URL(string: imageURL(for: index) ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(10.0)
                                        .padding(.bottom, 10)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(10.0)
                                        .padding(.bottom, 10)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                }//HStack

            }//VStack

            
        }
        .padding()
        .padding(.top)
        .padding(.bottom, 50)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }

func imageURL(for index: Int) -> String? {
        switch index {
        case 0:
            return item.link1img
        case 1:
            return item.link2img
        case 2:
            return item.link3img
        case 3:
            return item.link4img
        default:
            return nil
        }
    }
    
    func destinationURL(for index: Int) -> String? {
        switch index {
        case 0:
            return item.link1
        case 1:
            return item.link2
        case 2:
            return item.link3
        case 3:
            return item.link4
        default:
            return nil
        }
    }
}