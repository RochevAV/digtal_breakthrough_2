//
//  TasksOnLocationModuleViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class TasksOnLocationModuleViewTests: XCTestCase {

    // MARK: - Properties

    private var view: TasksOnLocationModuleViewController?
    private var output: TasksOnLocationModuleViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = TasksOnLocationModuleViewController()
        output = TasksOnLocationModuleViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class TasksOnLocationModuleViewOutputMock: TasksOnLocationModuleViewOutput {
    }

}
