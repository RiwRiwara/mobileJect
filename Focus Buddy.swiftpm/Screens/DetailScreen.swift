
import SwiftUI



struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let item: Item
    @EnvironmentObject var cartItems: CartItems
    @State private var showAddedToCartPopup = false

    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                //Product Image
                AsyncImage(url: URL(string: item.img ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                DescriptionView(item: item)
                // Spacer() if needed
            }
            .padding(.top, 5)
            
            VStack {
                Spacer()
                
                HStack {
                    Text(item.sale ?? "")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button(action: {
                        cartItems.addItem(item)
                        showAddedToCartPopup = true
                    }) {
                        Text("Add to Cart")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.white)
                            .cornerRadius(10.0)
                    }
                    .alert(isPresented: $showAddedToCartPopup) {
                        Alert(title: Text("Item Added to Cart"),
                              message: Text("\nThis item has been added to your cart."),
                              dismissButton: .default(Text("OK")))
                    }
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .cornerRadius(60.0, corners: .topLeft)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}



struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}







