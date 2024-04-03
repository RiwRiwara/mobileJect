import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
    
            TabView(selection: $selectedTab) {
                HomeView().tag(0)
                ChartView().tag(1)
                SettingsView().tag(2)
            }
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding()
            }
            .frame(width:200, height: 70)
            .background(AppColor.DarkHover)
            .cornerRadius(35)
            .padding(.horizontal, 10)
           
        })
    }
}


extension ContentView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image("\(isActive ? imageName + "-focus" : imageName)")
                .resizable()
                .frame(width: 30, height: 30)
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? AppColor.LightActive : .clear)
        .cornerRadius(100)
    }
}
