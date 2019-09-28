//
//  BeginDayModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class BeginDayModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: BeginDayModuleOutput? = nil) -> BeginDayViewController {
        guard let view = UIStoryboard(name: String(describing: BeginDayViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? BeginDayViewController else {
            fatalError("Can't load BeginDayViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = BeginDayPresenter()
        let router = BeginDayRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
