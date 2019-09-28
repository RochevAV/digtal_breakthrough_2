//
//  TaskOnLocationModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class TaskOnLocationModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TaskOnLocationModuleOutput? = nil) -> TaskOnLocationViewController {
        guard let view = UIStoryboard(name: String(describing: TaskOnLocationViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TaskOnLocationViewController else {
            fatalError("Can't load TaskOnLocationViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TaskOnLocationPresenter()
        let router = TaskOnLocationRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
