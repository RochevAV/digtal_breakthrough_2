//
//  TasksOnLocationModuleModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TasksOnLocationModuleModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: TasksOnLocationModuleViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load TasksOnLocationModuleViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = TasksOnLocationModuleModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "TasksOnLocationModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TasksOnLocationModulePresenter, "output is not TasksOnLocationModulePresenter")

        guard let presenter: TasksOnLocationModulePresenter = viewController.output as? TasksOnLocationModulePresenter else {
            XCTFail("Cannot assign viewController.output as TasksOnLocationModulePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in TasksOnLocationModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TasksOnLocationModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TasksOnLocationModuleRouter, "router is not TasksOnLocationModuleRouter")

        guard let router: TasksOnLocationModuleRouter = presenter.router as? TasksOnLocationModuleRouter else {
            XCTFail("Cannot assign presenter.router as TasksOnLocationModuleRouter")
            return
        }

        XCTAssertTrue(router.view is TasksOnLocationModuleViewController, "view in router is not TasksOnLocationModuleViewController")
    }

}
