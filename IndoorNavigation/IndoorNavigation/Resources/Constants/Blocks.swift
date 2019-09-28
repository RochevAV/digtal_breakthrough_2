//
//  Blocks.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

typealias EmptyBlock = () -> Void
typealias StringBlock = (String) -> Void
typealias BoolBlock = (Bool) -> Void
typealias CGRectBlock = (CGRect) -> Void
typealias CGFloatIntBlock = (CGFloat, Int) -> Void
typealias IntBlock = (Int) -> Void
typealias DateBlock = (Date) -> Void
typealias ImageBlock = (UIImage?) -> Void
typealias FloatBlock = (Float) -> Void
typealias UIColorBlock = (UIColor) -> Void
typealias CLProximityBlock = (CLProximity) -> Void

typealias Tag = (title: String, disabled: Bool)
