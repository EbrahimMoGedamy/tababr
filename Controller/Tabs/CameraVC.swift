//
//  CameraVC.swift
//  instgramApp
//
//  Created by Ebrahim  Mo Gedamy on 8/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bu(_ sender: UIButton) {
        self.handlePresentSegue(viewController: ProfileVC.self)
    }
    

}
