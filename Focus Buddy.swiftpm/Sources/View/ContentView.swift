import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home").tabItem { Text("Home") }.tag(1)
            Text("Chart").tabItem { Text("Chart") }.tag(2)
            Text("Settings").tabItem { Text("Settings") }.tag(3)
        }
     
    }
}


