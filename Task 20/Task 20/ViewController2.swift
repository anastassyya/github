//
//  ViewController2.swift
//  Task 20
//
//  Created by Анастасия Вишневская on 1/2/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class ViewController2: UIViewController, UITextFieldDelegate {
    
    var redTemp : String?
    var greenTemp: String?
    var blueTemp: String?

    
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

    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        redTextField.text = redTemp
        greenTextField.text = greenTemp
        blueTextField.text = blueTemp
        redLabel.text = redTextField.text
        greenLabel.text = greenTextField.text
        blueLabel.text = blueTextField.text
        redSlider.value = (redTextField.text!  as NSString).floatValue
        greenSlider.value = (greenTextField.text!  as NSString).floatValue
        blueSlider.value = (blueTextField.text!  as NSString).floatValue
        changeColourView ()
        
        //delete badge
        let nav1 = tabBarController?.viewControllers![1] as! ViewController1
        
        nav1.count = 0
        (self.tabBarController as? MainTabBarController)?.changeBadge()
        
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            redLabel.text = String(format:"%.2f", sender.value)
            redTextField.text = redLabel.text
        case 2:
            greenLabel.text = String(format:"%.2f", sender.value)
            greenTextField.text = greenLabel.text
        case 3:
            blueLabel.text = String(format:"%.2f", sender.value)
            blueTextField.text = blueLabel.text
        default: break
        }
        changeColourView()
    }

    @IBAction func setColoursFromKeyboard(_ sender: UITextField) {
        
        switch sender.tag {
        case 1:
            redSlider.value = (redTextField.text!  as NSString).floatValue
            redLabel.text = String(format:"%.2f", redSlider.value)
        case 2:
            greenSlider.value = (greenTextField.text!  as NSString).floatValue
            greenLabel.text = String(format:"%.2f", greenSlider.value)
        case 3:
            blueSlider.value = (blueTextField.text!  as NSString).floatValue
            blueLabel.text = String(format:"%.2f", blueSlider.value)
        default: break
        }
        changeColourView ()
        
        
    }
    
    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func changeColourView () {
        colourView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
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
        else if newText.count <= 4 && num! >= 0 && num! <= 1 {
            return true
        }
        else if newText.count > 4 {
            showMessageWarningCountSymbols()
            
        }
        else if num! < 0 || num! > 1 {
            showMessageWarningChoiceNumbers()
            
        }
        
        return newText.count <= 4 && num! >= 0 && num! <= 1
    }
    
    //show alert if a user entered wrong numbers
    func showMessageWarningChoiceNumbers(){
        let alertController = UIAlertController(title: "Enter numbers from 0 to 1", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //show alert if a user entered more numbers than maximum
    func showMessageWarningCountSymbols(){
        let alertController = UIAlertController(title: "You have entered a large number of decimal places. The maximum number of decimal places is 2", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
