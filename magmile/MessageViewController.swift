//
//  ChatViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/17/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    convenience init(){
        self.init(nibName:nil, bundle:nil)
        self.tabBarItem = UITabBarItem.init(title: "Message", image: #imageLiteral(resourceName: "message"), tag: 4)
        self.view.backgroundColor = UIColor.blue
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
