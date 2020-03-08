//
//  CalculatorAdd.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

class CalculatorAdd: ProtocolOperator {
    
    var leftNum: Float = 0
    var rightNum: Float = 0
    
    func willcalculatorNum(_ number: Float, _ type: CalculateNumberType) {

        if type == .left {
            leftNum = number
        }
        else {
            rightNum = number
        }
    }
    
    func execut() -> Float {
        return (leftNum + rightNum)
    }
}
