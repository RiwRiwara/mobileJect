import SwiftUI
struct DescriptionView: View {
    let item: Item

    var body: some View {
        VStack (alignment: .leading) {
            //Title
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)

            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(
                item.description ?? "No description available"
            )
                .lineSpacing(8.0)
                .opacity(0.6)

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
     
                HStack {
                    AsyncImage(url: URL(string: item.link1img ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    AsyncImage(url: URL(string: item.link2img ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }//HStack
                HStack {
                    AsyncImage(url: URL(string: item.link3img ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    AsyncImage(url: URL(string: item.link4img ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        @unknown default:
                            EmptyView()
                        }

                    }

                }//HStack


            
        }
        .padding()
        .padding(.top)
        .padding(.bottom, 50)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}
