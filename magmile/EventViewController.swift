//
//  EventViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/15/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit
import CoreDataStructures

class EventViewController: UIViewController {
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        self.tabBarItem = UITabBarItem.init(title: "Events", image: #imageLiteral(resourceName: "champaign"), tag: 1)
        self.view.backgroundColor = .yellow
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
    }
}
