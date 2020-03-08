//
//  OperatorProtocol.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

enum CalculateNumberType {
    case left
    case right
}

protocol ProtocolOperator {
    
    func execut() -> Float;
    func willcalculatorNum(_ number: Float, _ type: CalculateNumberType);
}
