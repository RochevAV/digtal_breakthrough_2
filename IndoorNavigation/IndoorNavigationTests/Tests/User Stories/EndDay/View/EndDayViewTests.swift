//
//  EndDayViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class EndDayViewTests: XCTestCase {

    // MARK: - Properties

    private var view: EndDayViewController?
    private var output: EndDayViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = EndDayViewController()
        output = EndDayViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class EndDayViewOutputMock: EndDayViewOutput {
    }

}
