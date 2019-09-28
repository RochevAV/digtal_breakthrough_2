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
        case bindCard(String)
        case awailableToBindAccounts(String)
        case changePinStep1(String)
        case changePinStep2(String)
        case changePinConfirm(String)
        case shortCards
        case changeLimit(String)
        case blockCard(String)
        case blockCardConfirm(String)
        case activation(String)
        case activationQuestion(String)
        case activationQuestionAnswer(String)

// swiftlint:disable cyclomatic_complexity

        func url() throws -> URL {
            return URL(fileURLWithPath: "https://radarservice.vapor.cloud/hello")
        }

    }

    /// Возвращает все маяки
    func getBeacons() -> Observer<[Beacon]> {
        return CustomChain()
            .default(with: .init(method: .get, route: Endpoint.allBeacons))
            .process()
    }

    func send(location: [Beacon]) -> Observer<Void> {
        return CustomChain()
            .default(with: .init(method: .post, route: Endpoint.sendLocation(location)))
            .process()
    }
}
