//
//  BeginDayModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class BeginDayModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: BeginDayViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load BeginDayViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = BeginDayModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "BeginDayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is BeginDayPresenter, "output is not BeginDayPresenter")

        guard let presenter: BeginDayPresenter = viewController.output as? BeginDayPresenter else {
            XCTFail("Cannot assign viewController.output as BeginDayPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in BeginDayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in BeginDayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is BeginDayRouter, "router is not BeginDayRouter")

        guard let router: BeginDayRouter = presenter.router as? BeginDayRouter else {
            XCTFail("Cannot assign presenter.router as BeginDayRouter")
            return
        }

        XCTAssertTrue(router.view is BeginDayViewController, "view in router is not BeginDayViewController")
    }

}
