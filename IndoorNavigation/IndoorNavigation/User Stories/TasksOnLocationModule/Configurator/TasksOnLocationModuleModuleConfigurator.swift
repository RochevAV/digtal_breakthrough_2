//
//  TasksOnLocationModuleModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class TasksOnLocationModuleModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TasksOnLocationModuleModuleOutput? = nil) -> TasksOnLocationModuleViewController {
        guard let view = UIStoryboard(name: String(describing: TasksOnLocationModuleViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TasksOnLocationModuleViewController else {
            fatalError("Can't load TasksOnLocationModuleViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TasksOnLocationModulePresenter()
        let router = TasksOnLocationModuleRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
