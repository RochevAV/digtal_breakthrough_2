//
//  TaskOnLocationModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskOnLocationModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: TaskOnLocationViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load TaskOnLocationViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = TaskOnLocationModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "TaskOnLocationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TaskOnLocationPresenter, "output is not TaskOnLocationPresenter")

        guard let presenter: TaskOnLocationPresenter = viewController.output as? TaskOnLocationPresenter else {
            XCTFail("Cannot assign viewController.output as TaskOnLocationPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in TaskOnLocationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TaskOnLocationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TaskOnLocationRouter, "router is not TaskOnLocationRouter")

        guard let router: TaskOnLocationRouter = presenter.router as? TaskOnLocationRouter else {
            XCTFail("Cannot assign presenter.router as TaskOnLocationRouter")
            return
        }

        XCTAssertTrue(router.view is TaskOnLocationViewController, "view in router is not TaskOnLocationViewController")
    }

}
