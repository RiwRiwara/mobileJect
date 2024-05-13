import SwiftUI
struct BottomNavBarView: View {
    @State private var isCartActive: Bool = false // State to track cart navigation

    var body: some View {
        HStack {
            BottomNavBarItem(image: Image(systemName: "house.fill"), action: {})
            BottomNavBarItem(image: Image(systemName: "cart.fill"), action: { self.isCartActive = true }) // Activate cart
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
        .fullScreenCover(isPresented: $isCartActive, content: {
            CartScreen() 
        })
    }
}