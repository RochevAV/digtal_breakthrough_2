//
//  LocationService.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

final class LocationService {

    private enum Endpoint: UrlRouteProvider {
        case allBeacons
        case sendLocation([Beacon])
        case checkIn(Beacon)
// swiftlint:disable cyclomatic_complexity

        func url() throws -> URL {
            let baseUrl = URL(fileURLWithPath: "https://radarservice.vapor.cloud/")
            switch self {
            case .allBeacons:
                return try baseUrl + "/allBeacons"
            case .sendLocation(let location):
                return try baseUrl + "/location"
            case .checkIn(let beacon):
                return try baseUrl + "/checkIn"
            }
        }
    }

    /// Возвращает все маяки
    func getBeacons() -> Observer<[Beacon]> {
        return CustomChain()
            .default(with: .init(method: .get, route: Endpoint.allBeacons))
            .process()
    }

    func checkIn(beacon: Beacon) -> Observer<Beacon> {
        return CustomChain()
            .default(with: .init(method: .post, route: Endpoint.checkIn(beacon)))
            .process()
    }

    func send(location: [Beacon]) -> Observer<Void> {
        return CustomChain()
            .default(with: .init(method: .post, route: Endpoint.sendLocation(location)))
            .process()
    }
}
