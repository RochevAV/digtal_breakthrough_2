//
//  StartDayModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StartDayModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: StartDayViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load StartDayViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = StartDayModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "StartDayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is StartDayPresenter, "output is not StartDayPresenter")

        guard let presenter: StartDayPresenter = viewController.output as? StartDayPresenter else {
            XCTFail("Cannot assign viewController.output as StartDayPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in StartDayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in StartDayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is StartDayRouter, "router is not StartDayRouter")

        guard let router: StartDayRouter = presenter.router as? StartDayRouter else {
            XCTFail("Cannot assign presenter.router as StartDayRouter")
            return
        }

        XCTAssertTrue(router.view is StartDayViewController, "view in router is not StartDayViewController")
    }

}
