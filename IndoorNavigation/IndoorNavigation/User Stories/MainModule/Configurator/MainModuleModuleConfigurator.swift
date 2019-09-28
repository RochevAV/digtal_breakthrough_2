//
//  MainModuleModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class MainModuleModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MainModuleModuleOutput? = nil) -> MainModuleViewController {
        guard let view = UIStoryboard(name: String(describing: MainModuleViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MainModuleViewController else {
            fatalError("Can't load MainModuleViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = MainModulePresenter()
        let router = MainModuleRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
