//
//  MyTaskOnLocationModuleViewTests.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import XCTest
@testable import IndoorNavigation

final class MyTaskOnLocationModuleViewTests: XCTestCase {

    // MARK: - Properties

    private var view: MyTaskOnLocationModuleViewController?
    private var output: MyTaskOnLocationModuleViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = MyTaskOnLocationModuleViewController()
        output = MyTaskOnLocationModuleViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    // MARK: - Mocks

    private final class MyTaskOnLocationModuleViewOutputMock: MyTaskOnLocationModuleViewOutput {
    }

}
