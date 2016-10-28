//
//  AppDelegate.swift
//  MagicLogin
//
//  Created by Arnaud Dupuy on 15/10/2016.
//  Copyright © 2016 Arnaud Dupuy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var mainViewController: UIViewController
        if isLoggedIn() {
            mainViewController = getHomeViewController()
        } else {
            mainViewController = LoginViewController()
        }
        
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    func getHomeViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeNavigationController")
    }
    
    enum changeRootAnnimation {
        case scale
        case translate
    }
    
    func changeRootViewController(_ viewController: UIViewController, withAnnimation annimation: changeRootAnnimation) {
        // https://gist.github.com/gimenete/53704124583b5df3b407
        if self.window!.rootViewController == nil {
            self.window!.rootViewController! = viewController
            return
        }
        let snapShot = self.window!.snapshotView(afterScreenUpdates: true)
        viewController.view.addSubview(snapShot!)
        self.window!.rootViewController! = viewController
        switch annimation {
        case .scale:
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                snapShot?.layer.opacity = 0
                snapShot?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
            }, completion: {(_ finished: Bool) -> Void in
                snapShot?.removeFromSuperview()
            })
        case .translate:
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                snapShot?.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, (self.window?.bounds.height)!, 0)
            }, completion: {(_ finished: Bool) -> Void in
                snapShot?.removeFromSuperview()
            })
        }
        
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
    }


}

