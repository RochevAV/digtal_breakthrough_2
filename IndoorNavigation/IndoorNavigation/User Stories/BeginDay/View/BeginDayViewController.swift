//
//  BeginDayViewController.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class BeginDayViewController: UIViewController, BeginDayViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: BeginDayViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction
    func getTaskButton(_ sender: Any) {
        output?.showTask()
    }

    @IBAction
    func showConfigurationMode(_ sender: Any) {
        output?.showConfigureMode()
    }

    // MARK: - BeginDayViewInput

}
