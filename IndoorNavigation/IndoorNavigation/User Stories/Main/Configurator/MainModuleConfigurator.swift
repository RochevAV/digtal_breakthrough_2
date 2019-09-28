//
//  MainModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit
import CoreLocation

final class MainModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MainModuleOutput? = nil) -> MainViewController {
        guard let view = UIStoryboard(name: String(describing: MainViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MainViewController else {
            fatalError("Can't load MainViewController from storyboard, check that controller is initial view controller")
        }

        let locationManager = BeaconRadar(with: CLLocationManager())
        let presenter = MainPresenter(with: locationManager)
        let router = MainRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
