//
//  TabBarViewController.swift
//  magmile
//
//  Created by Michael Cordero on 8/14/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit
//import FirebaseAuthUI
//import FirebaseGoogleAuthUI
//import FirebaseFacebookAuthUI
//import GoogleSignIn

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
  
        //Prepare child view controllers
        let nav: UINavigationController = UINavigationController()
        let nvc: NewsViewController = NewsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        nav.pushViewController(nvc, animated: false)
        nav.navigationBar.barTintColor = UIColor(red: 51/255, green: 90/255, blue: 149/255, alpha: 0.5)
        nav.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor : UIColor.white]
        let avc: AccountViewController = AccountViewController()
        let evc: EventViewController = EventViewController()
        let mvc: MerchandiseViewController = MerchandiseViewController()
        let cvc: MessageViewController = MessageViewController()
        let controllers: [UIViewController] = [nav,evc,mvc,avc,cvc]
        self.viewControllers = controllers
        self.selectedViewController = mvc         //TODO - This is a workaround for a bug. Selected VC should be "nav", but there is a navbar sizing issue.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//TODO - turn back on when in production
//        if !isUserSignedIn() {
//            showLoginView()
//        } else {
//            //continue code
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
//    private func isUserSignedIn() -> Bool {
//        let user: User? = Auth.auth().currentUser
//        return user != nil
//    }
//
//    private func showLoginView() {
//        if let authViewController = FUIAuth.defaultAuthUI()?.authViewController() {
//            present(authViewController, animated: false, completion: nil)
//        } else {
//            present(ErrorViewController(error: "Could not log user in!"), animated: false, completion: nil)
//        }
//    }
    
}
