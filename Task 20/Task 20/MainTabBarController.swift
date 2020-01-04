//
//  MainTabBarController.swift
//  Task 20
//
//  Created by Анастасия Вишневская on 1/2/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var redTemp : String?
    var greenTemp: String?
    var blueTemp: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //refresh tabBar
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        changeBadge()
        print (#function)
    }
    
    //change badge
    func changeBadge() {
        guard let item = tabBar.selectedItem else { return }
        guard let items = tabBar.items else { return }
        let nav = viewControllers![1] as! ViewController1
        
        if nav.count != 0  {
        items[2].badgeValue = "*"
        }
        else {
            items[2].badgeValue = nil
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
