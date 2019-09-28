//
//  MyTaskOnLocationModuleModuleConfiguratorTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class MyTaskOnLocationModuleModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: MyTaskOnLocationModuleViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load MyTaskOnLocationModuleViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = MyTaskOnLocationModuleModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "MyTaskOnLocationModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MyTaskOnLocationModulePresenter, "output is not MyTaskOnLocationModulePresenter")

        guard let presenter: MyTaskOnLocationModulePresenter = viewController.output as? MyTaskOnLocationModulePresenter else {
            XCTFail("Cannot assign viewController.output as MyTaskOnLocationModulePresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in MyTaskOnLocationModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MyTaskOnLocationModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MyTaskOnLocationModuleRouter, "router is not MyTaskOnLocationModuleRouter")

        guard let router: MyTaskOnLocationModuleRouter = presenter.router as? MyTaskOnLocationModuleRouter else {
            XCTFail("Cannot assign presenter.router as MyTaskOnLocationModuleRouter")
            return
        }

        XCTAssertTrue(router.view is MyTaskOnLocationModuleViewController, "view in router is not MyTaskOnLocationModuleViewController")
    }

}
