//
//  ViewControllerSecond.swift
//  Task 21
//
//  Created by Анастасия Вишневская on 1/5/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITextFieldDelegate, PassDataToMainViewController {

    weak var firstViewController: FirstViewController!
    weak var secondViewController: SecondViewController!
    let maxNumberSymbols = 4
    let minAllowableValue: Float = 0.00
    let maxAllowableValue: Float = 1.00

    
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redTextField.text = firstViewController.redTextField.text
        greenTextField.text = firstViewController.greenTextField.text
        blueTextField.text = firstViewController.blueTextField.text
    }
    
    enum Segues {
        static let toFirstController = "toFirstController"
        static let toSecondController = "toSecondController"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toFirstController {
            firstViewController = segue.destination as? FirstViewController
        }
        
        if segue.identifier == Segues.toFirstController {
            let destinationVC = segue.destination as! FirstViewController
            destinationVC.delegateData = self
        }
    }
    
    func passData(str: [String]) {
        redTextField.text = str[0]
        greenTextField.text = str[1]
        blueTextField.text = str[2]
        
    }
    
    @IBAction func setColoursFromKeyboard(_ sender: UITextField) {
        
        switch sender.tag {
        case 1:
           firstViewController.redTextField.text = redTextField.text!
           firstViewController.setColoursFromKeyboard(redTextField)
        case 2:
            firstViewController.greenTextField.text = greenTextField.text
            firstViewController.setColoursFromKeyboard(greenTextField)
        case 3:
            firstViewController.blueTextField.text = blueTextField.text
            firstViewController.setColoursFromKeyboard(blueTextField)
        default: break
        }
        firstViewController.changeColourView()
            
        }
    
    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }
        
        let newText = oldText.replacingCharacters(in: r, with: string)
        let num = Float(newText)
        if newText.isEmpty {
            return true
        }
        else if newText.count <= maxNumberSymbols && num! >= minAllowableValue && num! <= maxAllowableValue {
            return true
        }
        else if newText.count > maxNumberSymbols {
            firstViewController.showAlertWarningCountSymbols()
            
        }
        else if num! < minAllowableValue || num! > maxAllowableValue {
            firstViewController.showAlertWarningChoiceNumbers()
            
        }
        return newText.count <= maxNumberSymbols && num! >= minAllowableValue && num! <= maxAllowableValue
        
    }
}

