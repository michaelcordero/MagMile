//
//  AccountViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/15/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit
import FirebaseAuthUI

class AccountViewController: UIViewController {
    
    //Attributes
    //var tabBarHeight: CGFloat?
    
    convenience init(){
        self.init(nibName:nil, bundle:nil)
        let tbi: UITabBarItem = UITabBarItem.init(title: "Account", image: #imageLiteral(resourceName: "user"), tag: 3)
        self.tabBarItem = tbi
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(signOutButton())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    fileprivate func signOutButton() -> UIButton {
        let uiTabBarHeight: CGFloat = 110 //(self.parent?.tabBarController?.tabBar.frame.size.height)!
        let y_coordinate: CGFloat =  UIScreen.main.bounds.height - uiTabBarHeight //(UIApplication.shared.keyWindow?.rootViewController?.tabBarController?.view.frame.size.height)!
        let signOut: UIButton = UIButton.init(frame: CGRect.init(x: 0, y: y_coordinate, width: UIScreen.main.bounds.width, height: 50))
        signOut.backgroundColor = UIColor.lightGray
        signOut.setTitle("Sign Out", for: UIControlState.normal)
        signOut.setTitleColor(UIColor.red, for: UIControlState.normal)
        signOut.actions(forTarget: self, forControlEvent: UIControlEvents.touchUpInside)
        signOut.addTarget(self, action: #selector(self.signUserOut), for: UIControlEvents.touchUpInside)
        return signOut
    }
    
    @objc func signUserOut() -> Void {
        try! FUIAuth.defaultAuthUI()?.auth?.signOut()
        present(TabBarViewController(), animated: false, completion: nil)
    }

}
