//
//  NewsViewController.swift
//  ApHumanSovereigntyProject
//
//  Created by Alexander Korte on 12/12/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
    }
}
