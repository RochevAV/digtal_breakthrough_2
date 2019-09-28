//
//  EndDayModuleConfigurator.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class EndDayModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: EndDayModuleOutput? = nil) -> EndDayViewController {
        guard let view = UIStoryboard(name: String(describing: EndDayViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? EndDayViewController else {
            fatalError("Can't load EndDayViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = EndDayPresenter()
        let router = EndDayRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
