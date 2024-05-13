import SwiftUI
struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image(systemName: "house.fill"), action: {})
            BottomNavBarItem(image: Image(systemName: "cart.fill"),action:{})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}
