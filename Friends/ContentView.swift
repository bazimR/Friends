//
//  ContentView.swift
//  Friends
//
//  Created by Rishal Bazim on 20/03/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @State private var isLoading = false
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Meet your friends")
                        .font(.title.bold())
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                LazyVStack {
                    ForEach(users) { user in
                        NavigationLink(value: user) {
                            UserCardView(user: user)
                        }
                    }
                }
            }.padding([.horizontal]).navigationTitle("Friends")
                .navigationDestination(
                    for: User.self
                ) { user in
                    UserDetailView(user: user)
                }
        }.task {
            await getUserList()
        }.colorScheme(.light)

    }

    func getUserList() async {
        if !users.isEmpty {
            print("not called")
            return
        }
        print("called")
        guard
            let url = URL(
                string:
                    "https://www.hackingwithswift.com/samples/friendface.json")
        else {
            print("❌ Invalid URL")
            return
        }
        await MainActor.run { isLoading = true }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode(
                [User].self, from: data)
            // Add to SwiftData
            for user in decodedUsers {
                modelContext.insert(user)
            }

            try modelContext.save()
            isLoading = false
        } catch {
            await MainActor.run {
                isLoading = false
            }
            print("❌ Unexpected error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView().modelContainer(for: [User.self, Friend.self], inMemory: true)
}
