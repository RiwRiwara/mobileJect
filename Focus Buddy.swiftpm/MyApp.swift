import SwiftUI

@main
struct MyApp: App {
     @StateObject var cartItems = CartItems()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(cartItems)
        }
    }
}
