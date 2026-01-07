import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Circle()
                    .fill(Color.roarBlue)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Circle().stroke(Color.roarGold, lineWidth: 4)
                    )
                    .padding(.top, 40)
                
                Text("Panther Fan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack(spacing: 40) {
                    VStack {
                        Text("120")
                            .font(.headline)
                        Text("Followers")
                            .font(.caption)
                    }
                    VStack {
                        Text("54")
                            .font(.headline)
                        Text("Following")
                            .font(.caption)
                    }
                    VStack {
                        Text("12")
                            .font(.headline)
                        Text("Roars")
                            .font(.caption)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}
