//
//  HomeViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/15/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    convenience init(){
        self.init(nibName:nil, bundle:nil)
        self.tabBarItem = UITabBarItem.init(title: "News", image: #imageLiteral(resourceName: "newsfeed"), tag: 0)
        self.view.backgroundColor = UIColor.white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
