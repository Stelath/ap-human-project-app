//
//  NavigationBarController.swift
//  ApHumanSovereigntyProject
//
//  Created by Alexander Korte on 11/9/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
}
