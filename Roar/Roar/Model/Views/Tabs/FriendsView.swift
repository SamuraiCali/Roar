import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationView {
            List(0..<15) { i in
                HStack {
                    Circle()
                        .fill(Color.roarBlue)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text("Friend \(i)")
                            .font(.headline)
                        Text("Online now")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Friends")
        }
    }
}
