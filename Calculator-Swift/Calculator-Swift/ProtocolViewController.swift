//
//  ProtocolViewController.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {
    
    enum CalculateType: Int {
        case division = 0
        case muliti   = 1
        case delete   = 2
        case add      = 3
        case equal    = 4
        case clear
        case none
    }
    
    @IBOutlet weak var showLabel: UILabel?
    
    var calculateType = CalculateType.none
    var operatorSign: ProtocolOperator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addNumberToShowLabel(sender: UIButton) {
        
        if calculateType == .clear {
            showLabel?.text = "0"
            calculateType = .none
        }
        
        if showLabel?.text == "0" {
            showLabel?.text = sender.titleLabel?.text
        }
        else {
            showLabel?.text?.append(sender.titleLabel?.text ?? "")
        }
    }
    
    @IBAction func numberOperator(sender: UIButton) {
        
        let index = sender.tag - 10000
        calculateType = CalculateType(rawValue: index) ?? .clear
        calculateHnalder(calculateType)
    }
    
    func calculateHnalder(_ type: CalculateType) {
        
        switch type {
        case .division:
            operatorSign = CalculatorDivision()
            if let leftNum = Float(showLabel?.text ?? "0") {
                operatorSign?.willcalculatorNum(leftNum, .left)
            }
            break
        case .muliti:
            operatorSign = CalculatorMulite()
            if let leftNum = Float(showLabel?.text ?? "0") {
                operatorSign?.willcalculatorNum(leftNum, .left)
            }
            break
        case .delete:
            operatorSign = CalculatorDelete()
            if let leftNum = Float(showLabel?.text ?? "0") {
                operatorSign?.willcalculatorNum(leftNum, .left)
            }
            break
        case .add:
            operatorSign = CalculatorAdd()
            if let leftNum = Float(showLabel?.text ?? "0") {
                operatorSign?.willcalculatorNum(leftNum, .left)
            }
            break
        case .equal:
            if let rightNum = Float(showLabel?.text ?? "0") {
                operatorSign?.willcalculatorNum(rightNum, .right)
                showLabel?.text = String(operatorSign?.execut() ?? 0)
            }
            break
        default:
            break
        }
        calculateType = .clear
    }
}
