import SwiftUI

struct HomeScreenOld: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isFetchingData = true
    @State private var errorMessage = ""

    @StateObject private var NecklaceItems = DataManager()
    @StateObject private var EarringItems = DataManager()
    @StateObject private var BraceletItems = DataManager()
    @StateObject private var GlassesItems = DataManager()



    private let categories = ["All", "Bracelet", "Necklace", "Earring", "Glasses"]

    var body: some View {
        if isFetchingData {
            Image("Loading")
            Text("Loading...")
                .padding()
                .foregroundColor(ColorConfig.Primary.base)
                .onAppear {
                        CheckApiAvailable()
                        fetchNecklaceItems()
                        fetchEarringItems()
                        fetchBraceletItems()
                        fetchGlassesItems()
                    }
        } else if !errorMessage.isEmpty {
            Text(errorMessage)
                .padding()
        } else {
            NavigationView {
                ScrollViewReader { scrollView in
                    ZStack {
                        Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                            .ignoresSafeArea()
                        
                        ScrollView (showsIndicators: false) {
                            VStack (alignment: .leading) {
                                
                                AppBarView()
                                
                                TagLineView()
                                    .padding()
                                
                                SearchAndScanView(search: $search)

                                if !search.isEmpty {
                                    SearchResultsView(search: search)
                                }

                                    ScrollView (.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(categories.indices, id: \.self) { index in
                                                Button(action: {
                                                    selectedIndex = index
                                                    withAnimation {
                                                        scrollView.scrollTo("topic\(categories[index])", anchor: .top)
                                                    }
                                                }) {
                                                    CategoryView(isActive: selectedIndex == index, text: categories[index])
                                                }
                                            }

                                        }
                                        .padding()
                                    }
                                    


                                Text("    Necklace")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .id("topicNecklace")


                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack (spacing: 0) {
                                        ForEach(NecklaceItems.fetchedItems, id: \.self) { item in
                                            ProductCardViewApi(size: 180, item: item)
                                        }
                                        .padding(.leading)
                                    }
                                } // ScrollView
                                
                                Text("    Earring")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .id("topicEarring")

                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack (spacing: 0) {
                                        ForEach(EarringItems.fetchedItems, id: \.self) { item in
                                            ProductCardViewApi(size: 180, item: item)
                                        }
                                        .padding(.leading)
                                    }
                                }// ScrollView
                                
                                Text("    Bracelet")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .id("topicBracelet")

                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack (spacing: 0) {
                                        ForEach(BraceletItems.fetchedItems, id: \.self) { item in
                                            ProductCardViewApi(size: 180, item: item)
                                        }
                                        .padding(.leading)
                                    }
                                }// ScrollView
                                
                                Text("    Glasses")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .id("topicGlasses")

                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack (spacing: 0) {
                                        ForEach(GlassesItems.fetchedItems, id: \.self) { item in
                                            ProductCardViewApi(size: 180, item: item)
                                        }
                                        .padding(.leading)
                                    }
                                }// ScrollView

                                
                                
                            }
                        }.padding(.top, 20)
                        
                        VStack {
                            Spacer()
                            BottomNavBarView().padding()
                        }
                    } // ZStack
                }// ScrollViewReader
            } // NavigationView
        }
    } // body
    
    func CheckApiAvailable() {
        guard let url = URL(string: Endpoint.baseURL + Endpoint.Path.testApi) else {
            self.errorMessage = "Invalid URL"
            print("Invalid URL")
            self.isFetchingData = false
            return
        }
        DataFetcher.fetchData(from: url, responseType: MessageResponse.self) { result in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.isFetchingData = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = "Server unavailable"
                    self.isFetchingData = false
                }
            }
        }
    }

    func fetchNecklaceItems() {
        NecklaceItems.fetchItems(category: "Necklace")
    }

    func fetchEarringItems() {
        EarringItems.fetchItems(category: "Earring")
    }

    func fetchBraceletItems() {
        BraceletItems.fetchItems(category: "Bracelet")
    }

    func fetchGlassesItems() {
        GlassesItems.fetchItems(category: "Glasses")
    }


    


}

