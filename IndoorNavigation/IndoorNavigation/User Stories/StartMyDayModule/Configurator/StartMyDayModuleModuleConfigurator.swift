//
//  StartMyDayModuleModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class StartMyDayModuleModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: StartMyDayModuleModuleOutput? = nil) -> StartMyDayModuleViewController {
        guard let view = UIStoryboard(name: String(describing: StartMyDayModuleViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? StartMyDayModuleViewController else {
            fatalError("Can't load StartMyDayModuleViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = StartMyDayModulePresenter()
        let router = StartMyDayModuleRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
