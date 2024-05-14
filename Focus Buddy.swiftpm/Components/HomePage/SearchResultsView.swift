import SwiftUI

struct SearchResultsView: View {
    let search: String

    @StateObject private var searchItems = DataManager()
    @State private var isFetchingData = true
    
    var body: some View {
        VStack {
            Text("Search Results")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            if isFetchingData {
            Spacer()
            Text("Loading...")
                .padding()
                .onAppear {
                        fetchSearch()
                    }
                    .onReceive(searchItems.$fetchedItems) { _ in
                        isFetchingData = false
                    }
                    .onChange(of: search) { _ in
                        isFetchingData = true
                        fetchSearch()
                    }
            }else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(searchItems.fetchedItems, id: \.self) { item in
                            ProductCardViewApi(size: 180, item: item)
                                .padding(.trailing, 10) 
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.horizontal, 5)
    }

    private func fetchSearch() {
        searchItems.fetchItems(name: search )
    }
}