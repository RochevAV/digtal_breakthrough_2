//
//  EndDayModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class EndDayModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: EndDayViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load EndDayViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = EndDayModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "EndDayViewController is nil after configuration")
        XCTAssertTrue(viewController.output is EndDayPresenter, "output is not EndDayPresenter")

        guard let presenter: EndDayPresenter = viewController.output as? EndDayPresenter else {
            XCTFail("Cannot assign viewController.output as EndDayPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in EndDayPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in EndDayPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is EndDayRouter, "router is not EndDayRouter")

        guard let router: EndDayRouter = presenter.router as? EndDayRouter else {
            XCTFail("Cannot assign presenter.router as EndDayRouter")
            return
        }

        XCTAssertTrue(router.view is EndDayViewController, "view in router is not EndDayViewController")
    }

}
