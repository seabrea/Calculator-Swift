//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by He Bob on 2020/3/7.
//  Copyright © 2020 He Bob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operatorExe: OperatorBase?
    
    @IBOutlet weak var showLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextViewController() {
        navigationController?.pushViewController(ProtocolViewController(), animated: true)
    }
    
    
    @IBAction func addNumberToShowLabel(sender: UIButton) {
        
        if (operatorExe != nil) && (operatorExe!.needClear) {
            showLabel?.text = "0"
        }
        
        if showLabel?.text == "0" {
            showLabel?.text = sender.titleLabel?.text
            operatorExe?.needClear = false
        }
        else {
            showLabel?.text?.append(sender.titleLabel?.text ?? "")
        }
        
    }
    
    @IBAction func numberOperator(sender: UIButton) {
        
        let index = sender.tag - 10000
        switch index {
        case 0:
            operatorExe = OperatorDivision()
            operatorExe?.leftNum = operatorExe?.formatNum(showLabel?.text ?? "0")
            break
        case 1:
            operatorExe = OperatorMultiplication()
            operatorExe?.leftNum = operatorExe?.formatNum(showLabel?.text ?? "0")
            break
        case 2:
            operatorExe = Operatordelete()
            operatorExe?.leftNum = operatorExe?.formatNum(showLabel?.text ?? "0")
            break
        case 3:
            operatorExe = OperatorAdd()
            operatorExe?.leftNum = operatorExe?.formatNum(showLabel?.text ?? "0")
            break
        case 4:
            operatorExe?.rightNum = operatorExe?.formatNum(showLabel?.text ?? "0")
            executeOperator()
            break
        default: break
        }
        operatorExe?.needClear = true
    }
    
    func executeOperator() {
        
        guard (operatorExe != nil) else {
            fatalError()
        }
        
        showLabel?.text = String(operatorExe?.execute() ?? 0)
        operatorExe = nil
    }
}

