//
//  AppDelegate.swift
//  Swifty
//
//  Created by Alicia Chao on 8/19/21.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //MARK: Branch Initialization
        // Add||Remove Live<->Test; Must match the test key of your deep link **
        Branch.setUseTestBranchKey(false)
        let branch = Branch.getInstance()
        // Add||Remove based on logging needs, use with TEST key
        // branch.enableLogging()
        branch.validateSDKIntegration()

        branch.initSession(launchOptions: launchOptions) { params, error in
            print(params as? [String: AnyObject] ?? {})
            // params = deep link data
            // do stuff with deep link data (nav to page, display content, etc)
            //MARK: Routing Logic
            // Set Identity
            branch.setIdentity("Swifty_TestApp_iOS")
        }
      return true
    }

    //MARK: URI Schemes
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Branch.getInstance().application(app, open: url, options: options)

//        // Pass the url to the handle deep link call
//        let branchHandled = Branch.getInstance().application(
//            application,
//            open: url,
//            options: options
//        )
//        if (!branchHandled) {
//            // If not handled by Branch, do other deep link routing for the
//            // Facebook SDK, Pinterest SDK, etc
//        }
//        return true
    }
    
    //MARK: Universal Links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let handledByBranch = Branch.getInstance().continue(userActivity)
//        handler for Universal Links
        return handledByBranch
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification launchOptions: [AnyHashable: Any]) -> Void {
        Branch.getInstance().handlePushNotification(launchOptions)
    }
    
    //MARK: ATTracking Permission Settings
    // User denied access? Provide shortcut to Settings to change tracking permission
    func gotoAppPrivacySettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(url) else {
                assertionFailure("Not able to open App privacy settings")
                return
        }

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

