//
//  MainModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class MainModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: MainViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load MainViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = MainModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "MainViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MainPresenter, "output is not MainPresenter")

        guard let presenter: MainPresenter = viewController.output as? MainPresenter else {
            XCTFail("Cannot assign viewController.output as MainPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in MainPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MainPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MainRouter, "router is not MainRouter")

        guard let router: MainRouter = presenter.router as? MainRouter else {
            XCTFail("Cannot assign presenter.router as MainRouter")
            return
        }

        XCTAssertTrue(router.view is MainViewController, "view in router is not MainViewController")
    }

}
