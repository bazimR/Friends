//
//  CodableFriend.swift
//  Friends
//
//  Created by Rishal Bazim on 20/03/25.
//

import Foundation
import SwiftData

@Model
class Friend: Codable, Identifiable, Hashable {
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    var id: UUID
    var name: String

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
