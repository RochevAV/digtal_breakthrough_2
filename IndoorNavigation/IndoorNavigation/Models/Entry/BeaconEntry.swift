
import NodeKit

struct BeaconEntry {
    let beaconId: String
    let distance: String
}

// MARK: - Decodable

extension BeaconEntry: Codable {

    enum CodingKeys: String, CodingKey {
        case beaconId
        case distance
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.beaconId = try container.decode(String.self, forKey: .beaconId)
        self.distance = try container.decode(String.self, forKey: .distance)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.beaconId, forKey: .beaconId)
        try container.encode(self.distance, forKey: .distance)
    }
}

// MARK: - RawMappable

extension BeaconEntry: RawMappable {
    typealias Raw = Json
}
