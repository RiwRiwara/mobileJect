import SwiftUI

struct SearchResultsView: View {
    let search: String

    @StateObject private var searchItems = DataManager()
    @State private var isFetchingData = true
    
    var body: some View {
        VStack {
            if isFetchingData {
            Text("Loading...")
                .padding()
                .onAppear {
                        fetchSearch()
                    }
                    .onReceive(searchItems.$fetchedItems) { _ in
                        isFetchingData = false
                    }
            }else {
                                    ForEach(searchItems.fetchedItems, id: \.self) { item in
                                        ProductCardViewApi(size: 180, item: item)
                                    }
                                    .padding(.leading)
            }
        }
        .padding()
    }

    private func fetchSearch() {
        searchItems.fetchItems(name: search )
    }
}