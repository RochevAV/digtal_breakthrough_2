//
//  MainModuleModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class MainModuleModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: MainModuleViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load MainModuleViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = MainModuleModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "MainModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MainModulePresenter, "output is not MainModulePresenter")

        guard let presenter: MainModulePresenter = viewController.output as? MainModulePresenter else {
            XCTFail("Cannot assign viewController.output as MainModulePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in MainModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MainModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MainModuleRouter, "router is not MainModuleRouter")

        guard let router: MainModuleRouter = presenter.router as? MainModuleRouter else {
            XCTFail("Cannot assign presenter.router as MainModuleRouter")
            return
        }

        XCTAssertTrue(router.view is MainModuleViewController, "view in router is not MainModuleViewController")
    }

}
