//
//  StartMyDayModuleModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StartMyDayModuleModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: StartMyDayModuleViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load StartMyDayModuleViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = StartMyDayModuleModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "StartMyDayModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is StartMyDayModulePresenter, "output is not StartMyDayModulePresenter")

        guard let presenter: StartMyDayModulePresenter = viewController.output as? StartMyDayModulePresenter else {
            XCTFail("Cannot assign viewController.output as StartMyDayModulePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in StartMyDayModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in StartMyDayModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is StartMyDayModuleRouter, "router is not StartMyDayModuleRouter")

        guard let router: StartMyDayModuleRouter = presenter.router as? StartMyDayModuleRouter else {
            XCTFail("Cannot assign presenter.router as StartMyDayModuleRouter")
            return
        }

        XCTAssertTrue(router.view is StartMyDayModuleViewController, "view in router is not StartMyDayModuleViewController")
    }

}
