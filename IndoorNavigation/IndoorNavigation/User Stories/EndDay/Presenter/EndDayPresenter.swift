//
//  EndDayPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class EndDayPresenter: EndDayViewOutput, EndDayModuleInput {

    // MARK: - Properties

    weak var view: EndDayViewInput?
    var router: EndDayRouterInput?
    var output: EndDayModuleOutput?

    // MARK: - EndDayViewOutput

    // MARK: - EndDayModuleInput
    
    func didUpdate(beacon: Beacon?) {
        view?.didUpdate(beacon: beacon)
    }
}
