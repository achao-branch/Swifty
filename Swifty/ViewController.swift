//
//  ViewController.swift
//  Swifty
//
//  Created by Alicia Chao on 8/19/21.
//

import UIKit
import Branch

import AdSupport
import AppTrackingTransparency

//protocol ViewDelegate {
//    func didTapCreateDeepLink(_ view: ViewController, sender: UIButton)
//    func didTapReadDeepLinkData(_ view: ViewController, sender: UIButton)
//    func didTapRouteToDeepLinkItem(_ view: ViewController, sender: UIButton)
//    func didTapShareDeepLink(_ view: ViewController, sender: UIButton)
//    func didTapToggleUserTracking(_ view: ViewController, sender: UIButton)
//    func didTapTriggerATTPrompt(_ view: ViewController, sender: UIButton)
//    func didTapLogin(_ view: ViewController, sender: UIButton)
//    func didTapLogout(_ view: ViewController, sender: UIButton)
//    func didTapCommerceEvent(_ view: ViewController, sender: UIButton)
//    func didTapContentEvent(_ view: ViewController, sender: UIButton)
//    func didTapLifeCycleEvent(_ view: ViewController, sender: UIButton)
//    func didTapEvent(_ view: ViewController, sender: UIButton)
//}

class ViewController: UIViewController {
        
    //MARK: Properties
//    var delegate: ViewDelegate?
    
    let buo = BranchUniversalObject()
    let lp = BranchLinkProperties()

    var appLabel: UILabel!
    var textView: UITextView!
    var createLink: UIButton!
    var readLink: UIButton!
    var routeLink: UIButton!
    var shareLink: UIButton!
    var loginButton: UIButton!
    var logoutButton: UIButton!
    var commerceEvent: UIButton!
    var contentEvent: UIButton!
    var lifecycleEvent: UIButton!
    var customEvent: UIButton!
    var toggleUserTracking: UIButton!
    var triggerATTPrompt: UIButton!
    
    //MARK: Life Cycle Methods
    override func loadView() {
        // UIView parent class to view types: labels, buttons, progress views, etc.
        view = UIView()
        view.backgroundColor = .white

        //MARK: View Hierarchy
        appLabel = UILabel()
        appLabel.font = UIFont.systemFont(ofSize: 28.0, weight: .regular)
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        appLabel.text = "Shwifty"
        appLabel.textColor = .black
        appLabel.numberOfLines = 0
        view.addSubview(appLabel)
        
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isSelectable = true
        textView.isEditable = false
        textView.adjustsFontForContentSizeCategory = true
        textView.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        textView.text = "General Information:"
        textView.textColor = .gray
        textView.textAlignment = .left
        textView.backgroundColor = .white
        view.addSubview(textView)
        
        createLink = UIButton(type: .system)
        createLink.translatesAutoresizingMaskIntoConstraints = false
        createLink.setTitle("Create Deep Link", for: .normal)
        createLink.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        createLink.titleLabel?.textAlignment = .center
        createLink.setTitleColor(.white, for: .normal)
        createLink.backgroundColor = UIColor(red: 2/255, green: 128/255, blue: 144/255, alpha: 1)
        createLink.layer.cornerRadius = 8
        createLink.showsTouchWhenHighlighted = true
        view.addSubview(createLink)

        readLink = UIButton(type: .system)
        readLink.translatesAutoresizingMaskIntoConstraints = false
        readLink.setTitle("Read Deep Link Data", for: .normal)
        readLink.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        readLink.titleLabel?.textAlignment = .center
        readLink.setTitleColor(.white, for: .normal)
        readLink.backgroundColor = UIColor(red: 2/255, green: 128/255, blue: 144/255, alpha: 1)
        readLink.layer.cornerRadius = 8
        readLink.showsTouchWhenHighlighted = true
        readLink.titleLabel?.numberOfLines = 0
        view.addSubview(readLink)
        
        routeLink = UIButton(type: .system)
        routeLink.translatesAutoresizingMaskIntoConstraints = false
        routeLink.setTitle("Route to Deep Link Item", for: .normal)
        routeLink.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        routeLink.titleLabel?.textAlignment = .center
        routeLink.setTitleColor(.white, for: .normal)
        routeLink.backgroundColor = UIColor(red: 2/255, green: 128/255, blue: 144/255, alpha: 1)
        routeLink.layer.cornerRadius = 8
        routeLink.showsTouchWhenHighlighted = true
        routeLink.titleLabel?.numberOfLines = 0
        view.addSubview(routeLink)

        shareLink = UIButton(type: .system)
        shareLink.translatesAutoresizingMaskIntoConstraints = false
        shareLink.setTitle("Share Deep Link", for: .normal)
        shareLink.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        shareLink.titleLabel?.textAlignment = .center
        shareLink.setTitleColor(.white, for: .normal)
        shareLink.backgroundColor = UIColor(red: 2/255, green: 128/255, blue: 144/255, alpha: 1)
        shareLink.layer.cornerRadius = 8
        shareLink.showsTouchWhenHighlighted = true
        view.addSubview(shareLink)
        
        commerceEvent = UIButton(type: .system)
        commerceEvent.translatesAutoresizingMaskIntoConstraints = false
        commerceEvent.setTitle("Commerce Event", for: .normal)
        commerceEvent.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        commerceEvent.titleLabel?.textAlignment = .center
        commerceEvent.setTitleColor(.white, for: .normal)
        commerceEvent.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 178/255, alpha: 1)
        commerceEvent.layer.cornerRadius = 8
        commerceEvent.showsTouchWhenHighlighted = true
        view.addSubview(commerceEvent)
        
        contentEvent = UIButton(type: .system)
        contentEvent.translatesAutoresizingMaskIntoConstraints = false
        contentEvent.setTitle("Content Event", for: .normal)
        contentEvent.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        contentEvent.titleLabel?.textAlignment = .center
        contentEvent.setTitleColor(.white, for: .normal)
        contentEvent.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 178/255, alpha: 1)
        contentEvent.layer.cornerRadius = 8
        contentEvent.showsTouchWhenHighlighted = true
        view.addSubview(contentEvent)
        
        lifecycleEvent = UIButton(type: .system)
        lifecycleEvent.translatesAutoresizingMaskIntoConstraints = false
        lifecycleEvent.setTitle("Life Cycle Event", for: .normal)
        lifecycleEvent.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        lifecycleEvent.titleLabel?.textAlignment = .center
        lifecycleEvent.setTitleColor(.white, for: .normal)
        lifecycleEvent.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 178/255, alpha: 1)
        lifecycleEvent.layer.cornerRadius = 8
        lifecycleEvent.showsTouchWhenHighlighted = true
        view.addSubview(lifecycleEvent)
        
        customEvent = UIButton(type: .system)
        customEvent.translatesAutoresizingMaskIntoConstraints = false
        customEvent.setTitle("Custom Event", for: .normal)
        customEvent.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        customEvent.titleLabel?.textAlignment = .center
        customEvent.setTitleColor(.white, for: .normal)
        customEvent.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 178/255, alpha: 1)
        customEvent.layer.cornerRadius = 8
        customEvent.showsTouchWhenHighlighted = true
        view.addSubview(customEvent)
        
        loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 246/255, green: 174/255, blue: 45/255, alpha: 1)
        loginButton.layer.cornerRadius = 8
        loginButton.showsTouchWhenHighlighted = true
        view.addSubview(loginButton)
                
        logoutButton = UIButton(type: .system)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        logoutButton.titleLabel?.textAlignment = .center
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.backgroundColor = UIColor(red: 246/255, green: 174/255, blue: 45/255, alpha: 1)
        logoutButton.layer.cornerRadius = 8
        logoutButton.showsTouchWhenHighlighted = true
        view.addSubview(logoutButton)
        
        toggleUserTracking = UIButton(type: .system)
        toggleUserTracking.translatesAutoresizingMaskIntoConstraints = false
        toggleUserTracking.setTitle("Toggle User Tracking", for: .normal)
        toggleUserTracking.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        toggleUserTracking.titleLabel?.textAlignment = .center
        toggleUserTracking.setTitleColor(.white, for: .normal)
        toggleUserTracking.backgroundColor = UIColor(red: 198/255, green: 65/255, blue: 145/255, alpha: 1)
        toggleUserTracking.layer.cornerRadius = 8
        toggleUserTracking.showsTouchWhenHighlighted = true
        toggleUserTracking.titleLabel?.numberOfLines = 0
        view.addSubview(toggleUserTracking)
                
        triggerATTPrompt = UIButton(type: .system)
        triggerATTPrompt.translatesAutoresizingMaskIntoConstraints = false
        triggerATTPrompt.setTitle("Trigger ATT Prompt", for: .normal)
        triggerATTPrompt.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
        triggerATTPrompt.titleLabel?.textAlignment = .center
        triggerATTPrompt.setTitleColor(.white, for: .normal)
        triggerATTPrompt.backgroundColor = UIColor(red: 198/255, green: 65/255, blue: 145/255, alpha: 1)
        triggerATTPrompt.layer.cornerRadius = 8
        triggerATTPrompt.showsTouchWhenHighlighted = true
        triggerATTPrompt.titleLabel?.numberOfLines = 0
        view.addSubview(triggerATTPrompt)
        
        
        //MARK: Auto Layout Constraints
        NSLayoutConstraint.activate([
            appLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            appLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            appLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            textView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor),
            textView.heightAnchor.constraint(equalToConstant: 150),

            createLink.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            createLink.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            createLink.heightAnchor.constraint(equalToConstant: 60),
            createLink.widthAnchor.constraint(equalToConstant: 160),

            commerceEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            commerceEvent.centerYAnchor.constraint(equalTo: createLink.centerYAnchor),
            commerceEvent.heightAnchor.constraint(equalToConstant: 60),
            commerceEvent.widthAnchor.constraint(equalToConstant: 160),

            readLink.topAnchor.constraint(equalTo: createLink.bottomAnchor, constant: 20),
            readLink.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            readLink.heightAnchor.constraint(equalToConstant: 60),
            readLink.widthAnchor.constraint(equalToConstant: 160),

            contentEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            contentEvent.centerYAnchor.constraint(equalTo: readLink.centerYAnchor),
            contentEvent.heightAnchor.constraint(equalToConstant: 60),
            contentEvent.widthAnchor.constraint(equalToConstant: 160),
            
            routeLink.topAnchor.constraint(equalTo: readLink.bottomAnchor, constant: 20),
            routeLink.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            routeLink.heightAnchor.constraint(equalToConstant: 60),
            routeLink.widthAnchor.constraint(equalToConstant: 160),

            lifecycleEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            lifecycleEvent.centerYAnchor.constraint(equalTo: routeLink.centerYAnchor),
            lifecycleEvent.heightAnchor.constraint(equalToConstant: 60),
            lifecycleEvent.widthAnchor.constraint(equalToConstant: 160),
            
            shareLink.topAnchor.constraint(equalTo: routeLink.bottomAnchor, constant: 20),
            shareLink.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            shareLink.heightAnchor.constraint(equalToConstant: 60),
            shareLink.widthAnchor.constraint(equalToConstant: 160),

            customEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            customEvent.centerYAnchor.constraint(equalTo: shareLink.centerYAnchor),
            customEvent.heightAnchor.constraint(equalToConstant: 60),
            customEvent.widthAnchor.constraint(equalToConstant: 160),
            
            toggleUserTracking.topAnchor.constraint(equalTo: shareLink.bottomAnchor, constant: 20),
            toggleUserTracking.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            toggleUserTracking.heightAnchor.constraint(equalToConstant: 60),
            toggleUserTracking.widthAnchor.constraint(equalToConstant: 160),

            triggerATTPrompt.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            triggerATTPrompt.centerYAnchor.constraint(equalTo: toggleUserTracking.centerYAnchor),
            triggerATTPrompt.heightAnchor.constraint(equalToConstant: 60),
            triggerATTPrompt.widthAnchor.constraint(equalToConstant: 160),
            
            loginButton.topAnchor.constraint(equalTo: toggleUserTracking.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.widthAnchor.constraint(equalToConstant: 160),

            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            logoutButton.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 60),
            logoutButton.widthAnchor.constraint(equalToConstant: 160),
        ])
        
        // Generates a deep link within your app
        func didTapCreateDeepLink(_ view: ViewController, sender: UIButton) {
            // Create Content Reference (Set BUO Properties)
            buo.title = "My Content Title"
            buo.contentDescription = "My Content Description"
            buo.imageUrl = "https://branch.io/img/logo-dark.svg"
            buo.publiclyIndex = true
            buo.locallyIndex = true
            buo.contentMetadata.customMetadata["key1"] = "value1"
            buo.canonicalUrl = "https://help.branch.io"
            
            // Create Link Reference (Set Link Properties)
            lp.channel = "in-app"
            lp.feature = "create branch link"
            lp.campaign = "creation"
            lp.stage = "new user"
            lp.tags = ["one", "two", "three"]

            lp.addControlParam("$desktop_url", withValue: "http://example.com/desktop")
            lp.addControlParam("$ios_url", withValue: "http://example.com/ios")
            lp.addControlParam("$ipad_url", withValue: "http://example.com/ios")
            lp.addControlParam("$android_url", withValue: "http://example.com/android")

            lp.addControlParam("custom_data", withValue: "yes")
            lp.addControlParam("look_at", withValue: "this")
            lp.addControlParam("nav_to", withValue: "over here")
            lp.addControlParam("random", withValue: UUID.init().uuidString)
            
            // Create Deep Link
            buo.getShortUrl(with: lp) { url, error in
                view.textView.text = "Created Deep Link: \n" + (url ?? "")
            }
        }
        
        // Retrieve Branch data from a deep link
        // Best practice: receive data from the listener (to prevent a race condition)
        // listener: initSession (within AppDelegate didFinishLaunchingWithOptions)
        func didTapReadDeepLinkData(_ view: ViewController, sender: UIButton) {
            // Retrieve Latest Referring Parameters
            let sessionParams = Branch.getInstance().getLatestReferringParams()

            view.textView.text = "Latest Referring Parameters: \n" +  ((sessionParams as NSDictionary?)?.description ?? "No Latest Referring Parameters")
        }
        
        
        // Change color, text, wtv
        func didTapRouteToDeepLinkData(_ view: ViewController, sender: UIButton) {
            view.routeLink.backgroundColor = .systemGray
        }

        
        // Will generate a Branch deep link and tag it with the channel the user selects
        func didTapShareDeepLink(_ view: ViewController, sender: UIButton) {
            // Create Content Reference (Set BUO Properties)
            buo.title = "My Content Title"
            buo.contentDescription = "My Content Description"
            buo.imageUrl = "https://branch.io/img/logo-dark.svg"
            buo.publiclyIndex = true
            buo.locallyIndex = true
            buo.contentMetadata.customMetadata["key1"] = "value1"
            buo.canonicalUrl = "https://help.branch.io"
            
            // Create Link Reference (Set Link Properties)
            lp.channel = "in-app"
            lp.feature = "create branch link"
            lp.campaign = "creation"
            lp.stage = "new user"
            lp.tags = ["one", "two", "three"]

            lp.addControlParam("$desktop_url", withValue: "http://example.com/desktop")
            lp.addControlParam("$ios_url", withValue: "http://example.com/ios")
            lp.addControlParam("$ipad_url", withValue: "http://example.com/ios")
            lp.addControlParam("$android_url", withValue: "http://example.com/android")

            lp.addControlParam("custom_data", withValue: "yes")
            lp.addControlParam("look_at", withValue: "this")
            lp.addControlParam("nav_to", withValue: "over here")
            lp.addControlParam("random", withValue: UUID.init().uuidString)
            
            // Uses Deep Link Properties

            // Call Share Sheet
            let message = "Check out this link"
            buo.showShareSheet(with: lp, andShareText: message, from: self) { (activityType, completed, error) in
                // activityType = Sharing Method (Messages || CopyToPasteboard || Mail || etc)
                // completed = bool, Share Comleted/Not Completed
                view.textView.text = "Share Sheet Completed: \n" + (activityType ?? "")
            }
        }
        
        func didTapCommerceEvent(_ view: ViewController, sender: UIButton){
            // Create Content Reference (BUO Properties)
            buo.title = "My Content Title"
            buo.canonicalUrl = "https://help.branch.io"
            buo.contentMetadata.contentSchema     = .commerceProduct
            buo.contentMetadata.productName       = "Nike Airforce 1s"
            buo.contentMetadata.quantity          = 1
            buo.contentMetadata.price             = 103.20
            buo.contentMetadata.currency          = .USD
            buo.contentMetadata.sku               = "1994320302"
            buo.contentMetadata.productName       = "my_product_name1"
            buo.contentMetadata.productBrand      = "my_prod_Brand1"
            buo.contentMetadata.productCategory   = .apparel
            buo.contentMetadata.productVariant    = "XS"
            buo.contentMetadata.condition         = .new
            
            // Track Content
            let event = BranchEvent.standardEvent(.purchase)
            // Add the BranchUniversalObject with the content (do not add an empty branchUniversalObject):
            event.contentItems     = [ buo ]
            // Add relevant event data:
            event.alias            = "purchase"
            event.transactionID    = "12344555"
            event.currency         = .USD
            event.revenue          = 1.5
            event.shipping         = 10.2
            event.tax              = 12.3
            event.coupon           = "test_coupon"
            event.affiliation      = "test_affiliation"
            event.eventDescription = "Event_description"
            event.searchQuery      = "item 123"
            event.customData       = [
                "Custom_Event_Property_Key1": "Custom_Event_Property_val1",
                "Custom_Event_Property_Key2": "Custom_Event_Property_val2"
            ]
            event.logEvent()
            view.textView.text = "Commerce Event Logged: \n" + buo.dictionary().description
        }
        func didTapContentEvent(_ view: ViewController, sender: UIButton){
            let event = BranchEvent.standardEvent(.viewItem)
            event.alias = "Pageview"
            event.eventDescription = "home_page"
            event.customData["Custom_Property_Key1"] = "Custom_Property_val1"
            event.logEvent()
            view.textView.text = "Content Event Logged: \n" + event.dictionary().description
        }
        func didTapLifeCycleEvent(_ view: ViewController, sender: UIButton){
            let event = BranchEvent.standardEvent(.completeRegistration)
            event.alias = "complete registration"
            event.customData["content_type"] = "email_registered"
            event.logEvent()
            view.textView.text = "LifeCycle Event Logged: \n" + event.dictionary().description
        }
        func didTapCustomEvent(_ view: ViewController, sender: UIButton){
            buo.contentMetadata = BranchContentMetadata()
            buo.contentMetadata.productName = "product_xyz"
            buo.contentMetadata.quantity = 1
            let event = BranchEvent(name: "coupon_applied")
            event.contentItems = [buo]
            event.transactionID = UUID().uuidString
            event.logEvent()
            view.textView.text = "Custom Event Logged: \n" + event.dictionary().description
        }
        
        func didTapToggleUserTracking(_ view: ViewController, sender: UIButton) {
            // Disable Tracking -> Deinitializes Branch Session
            switch Branch.trackingDisabled() {
            case false:
                Branch.setTrackingDisabled(true)
                view.textView.text = "Tracking Disabled"
            case true:
                Branch.setTrackingDisabled(false)
                view.textView.text = "Tracking Enabled"
            }
        }
        func didTapTriggerATTPrompt(_ view: ViewController, sender: UIButton) {
            if (ATTrackingManager.trackingAuthorizationStatus == .notDetermined) {
                ATTrackingManager.requestTrackingAuthorization { (status) in
    //                Branch.getInstance().handleATTAuthorizationStatus(status.rawValue)
                    switch status {
                    case .authorized:
                        print("Authorized")
                        let idfa = ASIdentifierManager.shared().advertisingIdentifier
                        print("IDFA: " + idfa.uuidString)
                    case .denied,
                         .notDetermined,
                         .restricted:
                        print("Not Authorized")
                        break
                    @unknown default:
                        print("Unknown")
                        break
                    }
                }
            }
        }
        func didTapLogin(_ view: ViewController, sender: UIButton) {
            // Set Identity
            Branch.getInstance().setIdentity("your_user_id")
            view.textView.text = "Identity Set"
        }
        func didTapLogout(_ view: ViewController, sender: UIButton) {
            // Log user out -> Deinitializes Branch Session
            Branch.getInstance().logout()
            view.textView.text = "Session Logout"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
