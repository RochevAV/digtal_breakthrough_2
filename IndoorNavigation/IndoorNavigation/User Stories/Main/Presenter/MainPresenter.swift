//
//  MainPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class MainPresenter: MainViewOutput, MainModuleInput {

    // MARK: - Properties

    weak var view: MainViewInput?
    var router: MainRouterInput?
    var output: MainModuleOutput?

    // MARK: Private Properties

    private var service: BeaconRadar

    init(with service: BeaconRadar) {
        self.service = service
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
        
        service.baseBeacon = Beacon(identifier: "34E87C7A-D3B0-4C40-BC1C-B87990DE4A3E",
                                    uuid: "34E87C7A-D3B0-4C40-BC1C-B87990DE4A3E",
                                    major: "16808",
                                    minor: "19400",
                                    distance: 5)
    }
}

// MARK: - MainViewOutput

// MARK: - MainModuleInput
