//
//  FriendsApp.swift
//  Friends
//
//  Created by Rishal Bazim on 20/03/25.
//

import SwiftData
import SwiftUI

@main
struct FriendsApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [User.self, Friend.self])
    }
}
