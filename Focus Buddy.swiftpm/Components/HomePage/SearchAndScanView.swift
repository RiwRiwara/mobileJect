import SwiftUI
struct SearchAndScanView: View {
    @Binding var search: String
    @State private var isCartActive: Bool = false
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8 )
                TextField("Search Accessories", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8 )
            
            HStack {
                //BottomNavBarItem(image: Image(systemName: "house.fill"), action: {})
                BottomNavBarItem(image: Image(systemName: "cart.fill"), action: { self.isCartActive = true }) // Activate cart
                
            }
            .padding(.vertical, 23)
            .frame(width: 65)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 0)
            .fullScreenCover(isPresented: $isCartActive, content: {
                CartScreen() 
            })
        }
        .padding(.horizontal)
    }
}