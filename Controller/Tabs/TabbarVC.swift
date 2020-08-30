//
//  TabbarVC.swift
//  instgramApp
//
//  Created by Ebrahim  Mo Gedamy on 8/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate {

     override func viewDidLoad() {
           super.viewDidLoad()
           
           delegate = self
           tabBar.barTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
           tabBar.tintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
           tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           DispatchQueue.main.asyncAfter( deadline: .now()+2) {
               //self.logoAnimation()
               
           }
          
           
       }
       
       /// : - func of delegate of TabBarController
       
       func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
           
           return true
       }
    


}
