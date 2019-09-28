//
//  TaskOnDayModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskOnDayModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: TaskOnDayViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load TaskOnDayViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = TaskOnDayModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "TaskOnDayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TaskOnDayPresenter, "output is not TaskOnDayPresenter")

        guard let presenter: TaskOnDayPresenter = viewController.output as? TaskOnDayPresenter else {
            XCTFail("Cannot assign viewController.output as TaskOnDayPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in TaskOnDayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TaskOnDayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TaskOnDayRouter, "router is not TaskOnDayRouter")

        guard let router: TaskOnDayRouter = presenter.router as? TaskOnDayRouter else {
            XCTFail("Cannot assign presenter.router as TaskOnDayRouter")
            return
        }

        XCTAssertTrue(router.view is TaskOnDayViewController, "view in router is not TaskOnDayViewController")
    }

}
