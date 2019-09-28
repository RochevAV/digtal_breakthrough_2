//
//  StopDayViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class StopDayViewTests: XCTestCase {

    // MARK: - Properties

    private var view: StopDayViewController?
    private var output: StopDayViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = StopDayViewController()
        output = StopDayViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class StopDayViewOutputMock: StopDayViewOutput {
    }

}
