//
//  OperatorBase.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

class OperatorBase {
    
    var leftNum: Float?
    var rightNum: Float?
    var needClear: Bool = false
    
    func formatNum(_ numberString: String) -> Float {
        
        if let result = Float(numberString) {
            return result
        }
        return 0
    }

    func execute() -> Float {
        return 0
    }
}
