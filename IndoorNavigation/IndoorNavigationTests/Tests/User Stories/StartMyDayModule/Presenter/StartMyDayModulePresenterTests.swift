//
//  StartMyDayModulePresenterTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StartMyDayModulePresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: StartMyDayModulePresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = StartMyDayModulePresenter()
        presenter?.router = MockRouter()
        view = MockViewController()
        presenter?.view = view
        output = MockModuleOutput()
        presenter?.output = output
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MockRouter: StartMyDayModuleRouterInput {
    }

    private final class MockViewController: StartMyDayModuleViewInput {
    }

    private final class MockModuleOutput: StartMyDayModuleModuleOutput {
    }

}
