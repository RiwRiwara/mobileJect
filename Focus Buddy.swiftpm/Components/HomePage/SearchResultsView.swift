import SwiftUI
import Combine

struct SearchResultsView: View {
    let search: String

    @StateObject private var searchItems = DataManager()
    @State private var isFetchingData = true
    @State private var searchText = ""
    private var debouncedSearchText = ""
    private var searchCancellable: AnyCancellable?

    init(search: String) {
        self.search = search
        // Debounce the search text
        searchCancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { _ in
                self.fetchSearch()
            }
    }

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
            } else {
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
        .onReceive(searchItems.$fetchedItems) { _ in
            isFetchingData = false
        }
        .onAppear {
            searchText = search
        }
        .onChange(of: search) { newValue in
            searchText = newValue
        }
    }

    private func fetchSearch() {
        guard debouncedSearchText != searchText else { return }
        searchItems.fetchItems(name: searchText)
        debouncedSearchText = searchText
        isFetchingData = true
    }
}
