//
//  ArchiveGame.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Lottie

class ArchiveGameDetailVC: UIViewController {
    
    var textIncomeLabel = ""
    var textDetailDataLabel = ""
    var result = false
    
    let money = AnimationView(name: "money")
    let failure = AnimationView(name: "dont worry")
    
    
    @IBOutlet weak var incomeLabel: UILabel!
    
    @IBOutlet weak var detailDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        money.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        money.center = CGPoint(x: self.view.center.x, y: 400)
        money.isHidden = true
        view.addSubview(money)
        
        
        
        failure.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        failure.center = CGPoint(x: self.view.center.x, y: 400)
        failure.isHidden = true
        view.addSubview(failure)
        
        if result == true {
            
            money.isHidden = false
            money.play()
            money.loopMode = .autoReverse
        }
        else {
            failure.isHidden = false
            failure.play()
            failure.loopMode = .autoReverse
        }
        
        detailDataLabel.sizeToFit()
        incomeLabel.text = textIncomeLabel
        detailDataLabel.text = textDetailDataLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
