//
//  StartDayViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StartDayViewTests: XCTestCase {

    // MARK: - Properties

    private var view: StartDayViewController?
    private var output: StartDayViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = StartDayViewController()
        output = StartDayViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class StartDayViewOutputMock: StartDayViewOutput {
    }

}
