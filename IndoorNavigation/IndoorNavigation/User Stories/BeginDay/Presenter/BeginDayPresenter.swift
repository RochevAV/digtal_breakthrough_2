//
//  BeginDayPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class BeginDayPresenter: BeginDayModuleInput {

    // MARK: - Properties

    weak var view: BeginDayViewInput?
    var router: BeginDayRouterInput?
    var output: BeginDayModuleOutput?

    // MARK: - BeginDayModuleInput

}

// MARK: - BeginDayViewOutput

extension BeginDayPresenter: BeginDayViewOutput {

    func showTask() {
        output?.showTask()
    }

    func showConfigureMode() {
        output?.showConfigureMode()
    }
}
