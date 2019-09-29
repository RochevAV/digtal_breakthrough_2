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

    weak var view: ModuleTransitionableNav?
    
    var configVC: EndDayViewInput?

}

// MARK: - MainRouterInput

extension MainRouter: MainRouterInput {
    
    func openBeginDay() {
        let viewController = BeginDayModuleConfigurator().configure(output: self)
        self.view?.push(module: viewController, animated: true)
    }

    func openEndDay() {
        let viewController = EndDayModuleConfigurator().configure()
        configVC = viewController
        self.view?.push(module: viewController, animated: true)
    }

    func openTaskOnDay() {
        let viewController = TaskOnDayModuleConfigurator().configure()
        self.view?.push(module: viewController, animated: true)
    }

    func openTaskOnLocation() {
        let viewController = TaskOnLocationModuleConfigurator().configure()
        self.view?.push(module: viewController, animated: true)
    }
    
    func didUpdate(beacon: Beacon?) {
        configVC?.didUpdate(beacon: beacon)
    }
}

extension MainRouter: BeginDayModuleOutput {

    func showTask() {
        openTaskOnDay()
    }

    func showConfigureMode() {
        openEndDay()
    }
}
