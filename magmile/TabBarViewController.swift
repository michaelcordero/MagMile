//
//  MainViewController.swift
//  magmile
//
//  Created by Michael Cordero on 8/14/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI
import GoogleSignIn

class TabBarViewController: UITabBarController {
    
    convenience init(){
        self.init(nibName:nil, bundle:nil)
        self.view.backgroundColor = UIColor.white
        self.tabBar.barTintColor = UIColor.lightGray
        //self.modalPresentationStyle = .custom
    }

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        //Prepare child view controllers
        let nvc: NewsViewController = NewsViewController()
        let avc: AccountViewController = AccountViewController()
        let evc: EventViewController = EventViewController()
        let mvc: MerchandiseViewController = MerchandiseViewController()
        let cvc: MessageViewController = MessageViewController()
        let controllers: [UIViewController] = [nvc,evc,mvc,avc,cvc]
        self.viewControllers = controllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isUserSignedIn() {
            showLoginView()
        } else {
            //continue code
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    private func isUserSignedIn() -> Bool {
        let user: User? = Auth.auth().currentUser
        return user != nil
    }
    
    private func showLoginView() {
        if let authViewController = FUIAuth.defaultAuthUI()?.authViewController() {
            present(authViewController, animated: false, completion: nil)
        } else {
            present(ErrorViewController(error: "Could not log user in!"), animated: false, completion: nil)
        }
    }
    
}
