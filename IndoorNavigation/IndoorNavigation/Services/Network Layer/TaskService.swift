//
//  TaskService.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import NodeKit

final class TaskService {

    private enum Endpoint: UrlRouteProvider {
        case allTask
        case sendLocation([Beacon])
        case checkIn(Beacon)

        // swiftlint:disable cyclomatic_complexity
        func url() throws -> URL {
            let baseUrl = URL(fileURLWithPath: "https://radarservice.vapor.cloud/" )
            switch self {
            case .allTask:
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
            .default(with: .init(method: .get, route: Endpoint.allTask))
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
