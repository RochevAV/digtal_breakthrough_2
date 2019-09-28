//
//  TaskOnDayModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class TaskOnDayModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TaskOnDayModuleOutput? = nil) -> TaskOnDayViewController {
        guard let view = UIStoryboard(name: String(describing: TaskOnDayViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TaskOnDayViewController else {
            fatalError("Can't load TaskOnDayViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TaskOnDayPresenter()
        let router = TaskOnDayRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
