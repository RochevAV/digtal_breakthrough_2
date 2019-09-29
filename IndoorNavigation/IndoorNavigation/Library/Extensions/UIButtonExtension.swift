//
//  UIButtonExtension.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

extension UIButton {

    enum BlinkingState {
        case disabled
        case checkin
        case alarm
    }

    func blinking(for state: BlinkingState) {
        alpha = 0.3
        switch state {
        case .disabled:
            backgroundColor = .clear
        case .checkin:
            backgroundColor = .green
        case .alarm:
            backgroundColor = .red
        }
    }

}
