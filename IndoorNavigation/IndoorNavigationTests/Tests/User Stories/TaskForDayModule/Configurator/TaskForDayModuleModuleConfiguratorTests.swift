//
//  TaskForDayModuleModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskForDayModuleModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: TaskForDayModuleViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load TaskForDayModuleViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = TaskForDayModuleModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "TaskForDayModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TaskForDayModulePresenter, "output is not TaskForDayModulePresenter")

        guard let presenter: TaskForDayModulePresenter = viewController.output as? TaskForDayModulePresenter else {
            XCTFail("Cannot assign viewController.output as TaskForDayModulePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in TaskForDayModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TaskForDayModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TaskForDayModuleRouter, "router is not TaskForDayModuleRouter")

        guard let router: TaskForDayModuleRouter = presenter.router as? TaskForDayModuleRouter else {
            XCTFail("Cannot assign presenter.router as TaskForDayModuleRouter")
            return
        }

        XCTAssertTrue(router.view is TaskForDayModuleViewController, "view in router is not TaskForDayModuleViewController")
    }

}
