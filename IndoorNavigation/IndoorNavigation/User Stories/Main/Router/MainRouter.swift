//
//  MainRouter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class MainRouter {

    // MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - MainRouterInput

extension MainRouter: MainRouterInput {
    func openBeginDay() {
        let viewController = BeginDayModuleConfigurator().configure()
        view?.push(module: viewController, animated: false)
    }

    func openEndDay() {
        let viewController = EndDayModuleConfigurator().configure()
        view?.presentModule(viewController, animated: false, completion: nil)

    }

    func openTaskOnDay() {
        let viewController = TaskOnDayModuleConfigurator().configure()
        view?.presentModule(viewController, animated: false, completion: nil)

    }

    func openTaskOnLocation() {
        let viewController = TaskOnLocationModuleConfigurator().configure()
        view?.presentModule(viewController, animated: false, completion: nil)
    }
}
