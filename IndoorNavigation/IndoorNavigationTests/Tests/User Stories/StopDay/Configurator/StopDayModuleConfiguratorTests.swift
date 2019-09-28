//
//  StopDayModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StopDayModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: StopDayViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load StopDayViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = StopDayModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "StopDayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is StopDayPresenter, "output is not StopDayPresenter")

        guard let presenter: StopDayPresenter = viewController.output as? StopDayPresenter else {
            XCTFail("Cannot assign viewController.output as StopDayPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in StopDayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in StopDayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is StopDayRouter, "router is not StopDayRouter")

        guard let router: StopDayRouter = presenter.router as? StopDayRouter else {
            XCTFail("Cannot assign presenter.router as StopDayRouter")
            return
        }

        XCTAssertTrue(router.view is StopDayViewController, "view in router is not StopDayViewController")
    }

}
