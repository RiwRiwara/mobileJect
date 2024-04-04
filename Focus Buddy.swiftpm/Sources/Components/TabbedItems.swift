
enum TabbedItems: Int, CaseIterable{
    case home = 0
    case chart
    case setting
    
    var title: String{
        switch self {
        case .home:
            return "Home ....."
        case .chart:
            return "Chart"
        case .setting:
            return "Setting"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .chart:
            return "chart"
        case .setting:
            return "setting"
        
        }
    }
}

