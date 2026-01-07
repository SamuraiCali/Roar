import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.roarGold)
                
                Text("Explore Content")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.roarBlue)
            }
            .navigationTitle("Explore")
        }
    }
}
