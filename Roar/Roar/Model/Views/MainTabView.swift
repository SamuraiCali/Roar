import SwiftUI

struct MainTabView: View {
    // Customizing the appearance of the Tab Bar
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.roarBlue)
        
        let itemAppearance = UITabBarItemAppearance()
        // Unselected icon color
        itemAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.6)
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white.withAlphaComponent(0.6)]
        
        // Selected icon color (Gold)
        itemAppearance.selected.iconColor = UIColor(Color.roarGold)
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.roarGold)]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            ForYouView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("For You")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
        .accentColor(.roarGold)
    }
}
