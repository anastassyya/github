//
//  RootViewController.swift
//  Task 19
//
//  Created by Анастасия Вишневская on 12/31/19.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate, PassDataToPreviousController {
    
    func passData(str: [String]) {
        redTextField.text = str[0]
        greenTextField.text = str[1]
        blueTextField.text = str[2]
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!

    
    @IBAction func goToRectangles(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rectanglesViewController = storyboard.instantiateViewController(withIdentifier: "RectanglesViewController_id") as! RectanglesViewController
        navigationController!.pushViewController(rectanglesViewController, animated: false)
    }
    
    @IBAction func goToSliders(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController_id") as? ViewController
        vc?.redTemp = redTextField.text!
        vc?.greenTemp = greenTextField.text!
        vc?.blueTemp = blueTextField.text!
        vc?.delegateData = self
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
        // Do any additional setup after loading the view
    

    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
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
            print (#function)
            
        }
        
        return newText.count <= 4 && num! >= 0 && num! <= 1
    }

    //show alert if an user entered wrong numbers
    func showMessageWarningChoiceNumbers(){
        let alertController = UIAlertController(title: "Enter numbers from 0 to 1", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //show alert if an user entered more numbers than maximum
    func showMessageWarningCountSymbols(){
        let alertController = UIAlertController(title: "You have entered a large number of decimal places. The maximum number of decimal places is 2", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }


}

