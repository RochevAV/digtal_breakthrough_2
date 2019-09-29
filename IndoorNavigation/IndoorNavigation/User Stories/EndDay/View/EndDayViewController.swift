//
//  EndDayViewController.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class EndDayViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOtlets
    
    @IBOutlet private weak var maps: UIImageView!
    
    @IBOutlet private weak var majorLabel: UILabel!
    @IBOutlet private weak var minorLabel: UILabel!
    
    @IBAction
    func clickedButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        button.blinking(for: .checkin)
        
    }
    // MARK: - Properties

    var output: EndDayViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        addActionToButtons()
    }

    private func configureAppearance() {
        maps.image = Asset.maps.image
    }
    
    private func changeStateButton(state: UIButton.BlinkingState) {
        view.subviews.forEach { item in
            if let button = item as? UIButton {
                button.blinking(for: state)
            }
        }
    }
    
    private func addActionToButtons() {
        view.subviews.forEach { item in
            if let button = item as? UIButton {
                button.addTarget(self, action: #selector(clickedButton(_:)), for: .touchUpInside)
            }
        }
    }
}

// MARK: - EndDayViewInput

extension EndDayViewController: EndDayViewInput {

    func didUpdate(beacon: Beacon?) {
        guard let beacon = beacon else {
            majorLabel.text = "Поиск ..."
            minorLabel.text = "Поиск ..."
            changeStateButton(state: .disabled)
            return
        }
        majorLabel.text = "\(beacon.major)"
        minorLabel.text = "\(beacon.minor)"
    }

}
