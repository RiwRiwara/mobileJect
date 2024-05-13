import SwiftUI
struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Accessories", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image(systemName:"magifyingglass")
                    .padding()
                    .background(ColorConfig.Primary.base)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}