//
//  UserCardView.swift
//  Friends
//
//  Created by Rishal Bazim on 21/03/25.
//

import SwiftUI

struct UserCardView: View {
    var user: User
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.name)
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.5))
                }
                Spacer()
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .foregroundStyle(
                        user.isActive
                            ? .green.opacity(0.5)
                            : .red.opacity(0.5))
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(user.tags.indices, id: \.self) { index in
                        Text(user.tags[index])
                            .font(.caption2)
                            .foregroundStyle(.blue)
                            .padding(5)
                            .background(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }.padding(.vertical, 15).padding(.horizontal, 15)
            .background(
                .gray.opacity(0.1)
            )
            .clipShape(
                .rect(cornerRadius: 15))
    }
}
