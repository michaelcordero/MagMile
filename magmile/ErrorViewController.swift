//
//  ErrorViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/19/17.
//  Copyright © 2017 Codec Software. All rights reserved.
//

import UIKit

class ErrorViewController: UINavigationController {
    
    convenience init(error: String){
        self.init(nibName:nil, bundle:nil)
        
        //Presentation
        self.view.backgroundColor = UIColor.white
        self.title = "Magmile Bartenders"
        let errorMessage: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 200))  // consider refactoring
        errorMessage.textColor = UIColor.red
        errorMessage.attributedText = NSAttributedString.init(string: error)
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
