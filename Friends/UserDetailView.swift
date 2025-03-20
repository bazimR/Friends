//
//  UserDetailView.swift
//  Friends
//
//  Created by Rishal Bazim on 21/03/25.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        ZStack {
            ScrollView {
                Text(user.about)
                    .foregroundStyle(.black.opacity(0.8))
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "briefcase")
                        Text(user.company)
                    }

                    HStack {
                        Image(systemName: "tree")
                        Text(user.age, format: .number)
                    }

                    HStack {
                        Image(systemName: "location")
                        Text(user.address)
                    }

                    HStack {
                        Image(systemName: "envelope")
                        Text(user.email)
                    }

                    HStack {
                        Image(systemName: "calendar.badge.checkmark")
                        Text(user.registered, format: .dateTime)
                    }
                    HStack(alignment: .center) {
                        Text("Tags:")
                        ScrollView(.horizontal, showsIndicators: false) {

                            HStack {
                                ForEach(user.tags.indices, id: \.self) {
                                    index in
                                    Text(user.tags[index])
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue.opacity(0.8))
                                        .clipShape(Capsule())
                                        .fixedSize()
                                }

                            }
                        }.frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Friends").font(.title3)
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }.padding([.horizontal, .bottom])
        }.navigationTitle(user.name).navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        UserDetailView(
            user: .init(
                id: UUID(),
                isActive: true,
                name: "rishal",
                age: 20,
                company: "Erpgulf",
                email: "rihsalmuhammmed@gmail.com",
                address: "Mavielry",
                about: "Softwaer developer love coding",
                registered: .now,
                tags: ["adsdsa", "adsaads"],
                friends: [.init(id: UUID(), name: "bazim")]
            ))

    }
}
