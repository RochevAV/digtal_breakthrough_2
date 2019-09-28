//
//  TaskOnLocationViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TaskOnLocationViewTests: XCTestCase {

    // MARK: - Properties

    private var view: TaskOnLocationViewController?
    private var output: TaskOnLocationViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = TaskOnLocationViewController()
        output = TaskOnLocationViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class TaskOnLocationViewOutputMock: TaskOnLocationViewOutput {
    }

}
