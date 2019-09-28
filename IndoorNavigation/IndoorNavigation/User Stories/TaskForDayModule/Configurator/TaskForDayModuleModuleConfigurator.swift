//
//  TaskForDayModuleModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class TaskForDayModuleModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TaskForDayModuleModuleOutput? = nil) -> TaskForDayModuleViewController {
        guard let view = UIStoryboard(name: String(describing: TaskForDayModuleViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TaskForDayModuleViewController else {
            fatalError("Can't load TaskForDayModuleViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TaskForDayModulePresenter()
        let router = TaskForDayModuleRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
