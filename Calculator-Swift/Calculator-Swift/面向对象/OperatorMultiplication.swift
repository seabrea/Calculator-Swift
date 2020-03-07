//
//  OperatorMultiplication.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

class OperatorMultiplication: OperatorBase {

    override func execute() -> Float {
        return leftNum! * rightNum!
    }
}
