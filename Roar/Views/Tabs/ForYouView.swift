import SwiftUI
import Amplify

struct ForYouView: View {
    @State private var posts: [Post] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            Group {
                if isLoading && posts.isEmpty {
                    ProgressView("Loading posts...")
                } else if let error = errorMessage {
                    VStack {
                        Text("Failed to load posts")
                            .font(.headline)
                        Text(error)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        Button("Retry") {
                            fetchPosts()
                        }
                        .padding()
                    }
                } else if posts.isEmpty {
                    VStack {
                        Text("No posts available.")
                            .foregroundColor(.secondary)
                        Button("Refresh") {
                            fetchPosts()
                        }
                        .padding()
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(posts, id: \.id) { post in
                                VStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text(post.videoURL ?? "No Video URL")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                        )
                                    
                                    HStack {
                                        Circle()
                                            .fill(Color.roarBlue)
                                            .frame(width: 40, height: 40)
                                        
                                        VStack(alignment: .leading) {
                                            Text("User")
                                                .font(.headline)
                                            if let team = post.teamTag, let sport = post.sportTag {
                                                Text("\(team) • \(sport)")
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    
                                    Text(post.description)
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
                    .refreshable {
                        await fetchPostsAsync()
                    }
                }
            }
            .navigationTitle("For You")
            .background(Color.gray.opacity(0.1))
            .onAppear {
                fetchPosts()
            }
        }
    }
    
    func fetchPosts() {
        Task {
            await fetchPostsAsync()
        }
    }
    
    func fetchPostsAsync() async {
        await MainActor.run { isLoading = true }
        do {
            let request = GraphQLRequest<Post>.list(Post.self)
            let result = try await Amplify.API.query(request: request)
            
            switch result {
            case .success(let postsList):
                print("Successfully retrieved \(postsList.count) posts")
                await MainActor.run {
                    self.posts = Array(postsList)
                    self.isLoading = false
                    self.errorMessage = nil
                }
            case .failure(let error):
                print("Got failed result with \(error.errorDescription)")
                await MainActor.run {
                    self.isLoading = false
                    self.errorMessage = error.errorDescription
                }
            }
        } catch {
            print("Failed to query posts - \(error)")
            await MainActor.run {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
