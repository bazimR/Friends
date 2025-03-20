//
//  CodableFriend.swift
//  Friends
//
//  Created by Rishal Bazim on 20/03/25.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    let id: UUID
    var name: String
}
