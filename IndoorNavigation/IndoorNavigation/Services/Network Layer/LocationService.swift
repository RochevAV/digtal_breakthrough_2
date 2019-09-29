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
        case allNodes
        case sendLocation([Beacon])
        case checkIn(Beacon)

        // swiftlint:disable cyclomatic_complexity
        func url() throws -> URL {
            let baseUrl = URL(fileURLWithPath: "https://radarservice.vapor.cloud/" )
            switch self {
            case .allNodes:
                return try baseUrl + "/allNodes"
            case .sendLocation(let location):
                return try baseUrl + "/location/\(location)"
            case .checkIn(let beacon):
                return try baseUrl + "/checkIn/\(beacon)"
            }
        }
    }

    /// Возвращает все вершины
    func getNodes() -> Observer<[Beacon]> {
        return CustomChain()
            .default(with: .init(method: .get, route: Endpoint.allNodes))
            .process()
    }

    ///Чекаем вершину графа
    func checkIn(beacon: Beacon) -> Observer<Beacon> {
        return CustomChain()
            .default(with: .init(method: .post, route: Endpoint.checkIn(beacon)))
            .process()
    }

    ///Отправляем свою беконлокацию
    func send(location: [Beacon]) -> Observer<Void> {
        return CustomChain()
            .default(with: .init(method: .post, route: Endpoint.sendLocation(location)))
            .process()
    }
}
