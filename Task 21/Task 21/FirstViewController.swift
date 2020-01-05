//
//  FirstViewController.swift
//  Task 21
//
//  Created by Анастасия Вишневская on 05/01/20.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

protocol PassDataToMainViewController {
    func passData (str: [String])
    
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class FirstViewController: UIViewController, UITextFieldDelegate {

    //set delegate
    var delegateData : PassDataToMainViewController?
    
    let maxNumberSymbols = 4
    let minAllowableValue: Float = 0.00
    let maxAllowableValue: Float = 1.00
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colourView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        redLabel.text = "0.5"
        greenLabel.text = "0.5"
        blueLabel.text = "0.5"
        redTextField.text = redLabel.text
        greenTextField.text = greenLabel.text
        blueTextField.text = blueLabel.text 
        
    }
    
    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    @IBAction func actionSlider(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            redLabel.text = String(format:"%.2f", sender.value)
            redTextField.text = redLabel.text
            setDelegate()
        case 2:
            greenLabel.text = String(format:"%.2f", sender.value)
            greenTextField.text = greenLabel.text
            setDelegate()
        case 3:
           blueLabel.text = String(format:"%.2f", sender.value)
           blueTextField.text = blueLabel.text
           setDelegate()
        default: break
        }
        changeColourView()
        
    }
    
    func setDelegate() {
        delegateData!.passData(str: [redTextField.text!, greenTextField.text!, blueTextField.text!])
    }

    func changeColourView () {
        colourView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func setColoursFromKeyboard(_ sender: UITextField) {
        switch sender.tag {
        case 1:
        redSlider.value = (redTextField.text!  as NSString).floatValue
        redLabel.text = String(format:"%.2f", redSlider.value)
            setDelegate()
        case 2:
        greenSlider.value = (greenTextField.text!  as NSString).floatValue
        greenLabel.text = String(format:"%.2f", greenSlider.value)
            setDelegate()
        case 3:
        blueSlider.value = (blueTextField.text!  as NSString).floatValue
        blueLabel.text = String(format:"%.2f", blueSlider.value)
            setDelegate()

        default: break
        }
        changeColourView ()
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
        self.present(alertController, animated: true, completion: nil)
    }
    
    //show alert if a user entered more numbers than maximum
    func showAlertWarningCountSymbols(){
        let alertController = UIAlertController(title: "You have entered a large number of decimal places. The maximum number of decimal places is 2", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }



}

