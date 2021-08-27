//
//  ATTracking.swift
//  Swifty
//
//  Created by Alicia Chao on 8/27/21.
//

import Foundation

import AdSupport
import AppTrackingTransparency

// Determine the app's current tracking authorization status:
//let status = ATTrackingManager.trackingAuthorizationStatus

//MARK: ATT system-permission alert request
// Only displayed when status = .notDetermined
// Will not display if "Allow Apps to Request to track" is turned off in system privacy settings
ATTrackingManager.requestTrackingAuthorization { status in
    DispatchQueue.main.async {
        switch status {
        case .authorized:
            // Authorized
            let idfa = ASIdentifierManager.shared().advertisingIdentifier
            self.label.text = idfa.uuidString
        case .denied,
             .notDetermined,
             .restricted:
            break
        @unknown default:
            break
        }
    }
}


