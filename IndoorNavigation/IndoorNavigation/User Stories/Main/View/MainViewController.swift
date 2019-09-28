//
//  MainViewController.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - MainViewInput
    
    func changeColor() {
        view.backgroundColor = .red
    }

}
