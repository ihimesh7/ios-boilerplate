//
//  CommonAPI.swift
//  Hearty
//
//  Created by Himesh Mistry on 9/27/21.
//

import Foundation
import UIKit
import StoreKit

class CommonAPI: NSObject {
    // MARK: - Share Instance
    class var sharedInstance: CommonAPI {
        struct Singleton {
            static let instance = CommonAPI()
        }
        return Singleton.instance
    }
}
// MARK: - API Call
extension CommonAPI {
    
}
// MARK: - StoreKitHelper
struct StoreKitHelper {
    static let numberOfTimesLaunchedKey = "numberOfTimesLaunched"
    static func displayStoreKit() {
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return
        }
        let lastVersionPromptedForReview = userDefault.string(forKey: "lastVersion")
        let numberOfTimesLaunched: Int = userDefault.integer(forKey: StoreKitHelper.numberOfTimesLaunchedKey)
        if numberOfTimesLaunched > 3 && currentVersion != lastVersionPromptedForReview {
            if #available(iOS 13.0, *) {
                SKStoreReviewController.requestReviewInCurrentScene()
            } else {
                // Fallback on earlier versions
            }
            userDefault.set(currentVersion, forKey: "lastVersion")
        }
    }
    static func incrementNumberOfTimesLaunched() {
        let numberOfTimesLaunched: Int = userDefault.integer(forKey: StoreKitHelper.numberOfTimesLaunchedKey)
        userDefault.set(numberOfTimesLaunched + 1, forKey: StoreKitHelper.numberOfTimesLaunchedKey)
    }
}
