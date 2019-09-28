//
//  TaskOnDayPresenterTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskOnDayPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: TaskOnDayPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = TaskOnDayPresenter()
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

    private final class MockRouter: TaskOnDayRouterInput {
    }

    private final class MockViewController: TaskOnDayViewInput {
    }

    private final class MockModuleOutput: TaskOnDayModuleOutput {
    }

}
