//
//  AppDelegate.swift
//  magmile
//
//  Created by Michael Cordero on 8/3/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate {
    
    //MARK: Properties
    var window: UIWindow?
    public var authUI: FUIAuth?
    let providers: [FUIAuthProvider] = [FUIFacebookAuth(),FUIGoogleAuth()]
    public var authSource: AuthenticationType?
    
    
    //MARK: Application Functions
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //FirebaseUI
        authUI = FUIAuth.defaultAuthUI()
        authUI?.isSignInWithEmailHidden = true
        authUI?.delegate = self
        authUI?.providers = providers
        
        //Launch
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        try! authUI?.signOut()      //probably want to log user activity
    }
    
    //Handles Google/Facebook Authentication Url
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
        authSource = AuthenticationType.match(url: url)
        let handled = authUI?.handleOpen(url, sourceApplication: sourceApplication) ?? false
        return handled
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let sourceApplicationOptions: String? = sourceApplication
        authSource = AuthenticationType.match(url: url)
        let handled = authUI?.handleOpen(url, sourceApplication: sourceApplicationOptions)
        return handled!
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        let name: String = user?.displayName ?? "Name not found!"
        print("User: \(name) SIGNED IN WITH: \(authSource.debugDescription)")
    }
    
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return FUIAuthPickerViewController(authUI: authUI)  //optional protocol method, but lots of network errors are generated w/o
    }
    
}

extension FUIAuthBaseViewController {
    open override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
        let logo: UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        logo.image = UIImage.init(named: "LoginScreen")
        self.view.addSubview(logo)
        self.view.sendSubview(toBack: logo)
    }
}

