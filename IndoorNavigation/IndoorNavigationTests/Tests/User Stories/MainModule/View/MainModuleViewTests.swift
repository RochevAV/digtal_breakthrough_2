//
//  MainModuleViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class MainModuleViewTests: XCTestCase {

    // MARK: - Properties

    private var view: MainModuleViewController?
    private var output: MainModuleViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = MainModuleViewController()
        output = MainModuleViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MainModuleViewOutputMock: MainModuleViewOutput {
    }

}
