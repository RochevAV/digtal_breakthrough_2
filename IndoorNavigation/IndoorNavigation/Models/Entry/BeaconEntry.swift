import NodeKit

struct BeaconEntry {
    let identifier: String
    let uuid: String
    let major: String
    let minor: String
    let distance: Int
}

// MARK: - Decodable

extension BeaconEntry: Codable {

    enum CodingKeys: String, CodingKey {
        case identifier
        case uuid
        case major
        case minor
        case distance
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.major = try container.decode(String.self, forKey: .major)
        self.minor = try container.decode(String.self, forKey: .minor)
        self.distance = try container.decode(Int.self, forKey: .distance)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.uuid, forKey: .uuid)
        try container.encode(self.major, forKey: .major)
        try container.encode(self.minor, forKey: .minor)
        try container.encode(self.distance, forKey: .distance)
    }
}

// MARK: - RawMappable

extension BeaconEntry: RawMappable {
    typealias Raw = Json
}
