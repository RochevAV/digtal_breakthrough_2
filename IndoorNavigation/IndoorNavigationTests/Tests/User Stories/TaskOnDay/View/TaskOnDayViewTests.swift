//
//  TaskOnDayViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskOnDayViewTests: XCTestCase {

    // MARK: - Properties

    private var view: TaskOnDayViewController?
    private var output: TaskOnDayViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = TaskOnDayViewController()
        output = TaskOnDayViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class TaskOnDayViewOutputMock: TaskOnDayViewOutput {
    }

}
