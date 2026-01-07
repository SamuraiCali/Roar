import SwiftUI

struct ForYouView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { i in
                        VStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 200)
                                .cornerRadius(10)
                            
                            HStack {
                                Circle()
                                    .fill(Color.roarBlue)
                                    .frame(width: 40, height: 40)
                                
                                VStack(alignment: .leading) {
                                    Text("User \(i)")
                                        .font(.headline)
                                    Text("@user\(i)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Text("This is a mock post #\(i) on the Roar social web app. Go FIU Panthers!")
                                .padding(.horizontal)
                                .font(.body)
                        }
                        .padding(.bottom)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("For You")
            .background(Color.gray.opacity(0.1))
        }
    }
}
