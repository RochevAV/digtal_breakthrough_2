//
//  MainPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class MainPresenter: MainViewOutput, MainModuleInput {

    // MARK: - Constants

    private enum Constants {
        static let major: UInt16 = 16808
        static let minor: UInt16 = 16808
        static let uuid = "1E75D047-5A38-4152-9FA5-F95EFB7DEBAF"
    }

    // MARK: - Properties

    weak var view: MainViewInput?
    var router: MainRouterInput?
    var output: MainModuleOutput?

    // MARK: Private Properties

    private var service: BeaconRadar
    private var locationService: LocationService

    init(with service: BeaconRadar) {
        self.service = service
        self.locationService = LocationService()
        configure()
    }

    // MARK: Private Methods

    private func configure() {

        service.didEnteredToWorkRegion = {
            self.router?.openBeginDay()
            self.view?.changeColor()
        }

        service.didCameoutToWorkRegion = {
            self.router?.openBeginDay()
        }

        service.didUpdateDistance = { _ in

        }

        service.didCheckIn = { beacon in
            self.locationService.checkIn(beacon: beacon)
        }

        service.baseBeacon = Beacon(identifier: Constants.uuid,
                                    uuid: Constants.uuid,
                                    major: Constants.major,
                                    minor: Constants.minor,
                                    distance: 5)
    }
}

// MARK: - MainViewOutput

// MARK: - MainModuleInput
