//
//  ViewController1.swift
//  Task 20
//
//  Created by Анастасия Вишневская on 1/2/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

extension String {
    var floatValueFirst: Float {
        return (self as NSString).floatValue
    }
}

class ViewController1: UIViewController, UITextFieldDelegate {
    
    var redTemp : String?
    var greenTemp: String?
    var blueTemp: String?
    var count: Int = 0
    let maxNumberSymbols = 4
    let minAllowableValue: Float = 0.00
    let maxAllowableValue: Float = 1.00
    
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var colourView: UIView!
    
    var colour = Colours(red: 0.5, green: 0.5, blue: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        redTemp = String(format:"%.2f", colour.red!)
        greenTemp = String(format:"%.2f", colour.green!)
        blueTemp = String(format:"%.2f", colour.blue!)
        redTextField.text! = String(format:"%.2f", colour.red!)
        greenTextField.text! = String(format:"%.2f", colour.green!)
        blueTextField.text! = String(format:"%.2f", colour.blue!)
        changeColourView ()
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //refer to the necessary viewcontroller
        let nav = tabBarController?.viewControllers![2] as! ViewController2
        
        nav.redTemp = redTextField?.text!
        nav.greenTemp = greenTextField?.text!
        nav.blueTemp = blueTextField?.text!
        print ("1\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        redTextField.text = redTemp
        greenTextField.text = greenTemp
        blueTextField.text = blueTemp
        changeColourView ()
        print ("1\(#function)")
    }
    
    @IBAction func EditDidEndTextFild(_ sender: UITextField) {
        count = 0
        count += 1
        changeColourView ()
        (self.tabBarController as? MainTabBarController)?.changeBadge()
        
    }
    
    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func changeColourView () {
        var redColourTemp = Float(redTextField.text!)
        var greenColourTemp = Float(greenTextField.text!)
        var blueColourTemp = Float(blueTextField.text!)
        if redColourTemp == nil {
            redColourTemp = 0
        }
        if greenColourTemp == nil {
            greenColourTemp = 0
        }
        if blueColourTemp == nil {
            blueColourTemp = 0
        }
        colourView.backgroundColor = UIColor(red: CGFloat(redColourTemp!), green: CGFloat(greenColourTemp!), blue: CGFloat(blueColourTemp!), alpha: 1)
        print (#function)
    }
    
    //to limit numbers in textfields
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
            showAlertWarningCountSymbols()
            
        }
        else if num! < minAllowableValue || num! > maxAllowableValue {
            showAlertWarningChoiceNumbers()
    
        }
        return newText.count <= maxNumberSymbols && num! >= minAllowableValue && num! <= maxAllowableValue
        
    }
    
    //show alert if a user entered wrong numbers
    func showAlertWarningChoiceNumbers(){
        let alertController = UIAlertController(title: "Enter numbers from 0 to 1", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
         print (#function)
        self.present(alertController, animated: true, completion: nil)
         print (#function)
    }
    
    //show alert if a user entered more numbers than maximum
    func showAlertWarningCountSymbols(){
        let alertController = UIAlertController(title: "You have entered a large number of decimal places. The maximum number of decimal places is 2", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    }
