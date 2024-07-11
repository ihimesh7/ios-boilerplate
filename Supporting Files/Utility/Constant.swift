//
//  Constant.swift
//  Hearty
//
//  Created by Himesh Mistry on 9/24/21.
//

import Foundation
import UIKit

var APP_DELEGATE = UIApplication.shared.delegate as? AppDelegate
var APP_UTILITES = AppUtilities.sharedInstance
var CommonAPIInstance = CommonAPI.sharedInstance
let userDefault = UserDefaults.standard
let codingFeatsKeyChain = "codingFeats.KeyChain"
var deviceId = UIDevice.current.identifierForVendor?.uuidString ?? "12345666"
let appStoreLink = "itms-apps://apple.com/app/idxxxxx"
let appStoreWebLink = "\nhttps://apps.apple.com/in/app/apple-store/idxxxxx"
let updateLink = "http://itunes.apple.com/us/lookup?bundleId="
let feedbackId = ".com"
let termsLink = ""
let policyLink = ""
let contactUs = "https://www.joinhearty.com/member-support"
let sharedSecret = "b38fddf022b546faa340548871f1e3d0"
var newVersion = Int()
var currentVersion = Int()
let updateAvailable = "Update Available v"
var updateMsg = "You are using an older version of this app. Please update with this version"
let updateNow = "Update Now"
let remindMeLater = "Remind me later"
let numbersOnly = "0123456789"
let alphabetsOnly = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

//MARK: - Product
class Product: NSObject {
//    static let tokens100 = "testmb.com.tokens100"
//    static let tokens200 = "testmb.com.tokens200"
//    static let tokens500 = "testmb.com.tokens500"
//    static let setProducts: Set = [tokens100, tokens200, tokens500]//
}

public enum VerifyReceiptURLType: String {
    case production = "https://buy.itunes.apple.com/verifyReceipt"
    case sandbox = "https://sandbox.itunes.apple.com/verifyReceipt"
}

//MARK: - Key
class AdKey: NSObject {
    static let key = "value"
}

class KeyChainKey: NSObject {
    static let key = "value"
}

class NotficationResponse: NSObject {
    static var response : UNNotificationResponse?
}

//MARK: - Product id
public enum Items: String {
    case subItem1 = "subItem1"
    case subItem2 = "subItem2"
}

//MARK: - Asset
class ColorAsset: NSObject {
    static let accent = UIColor(named: "AccentColor")
    static let secondaryColor = UIColor(named: "SecondaryColor")
    static let tertiaryColor = UIColor(named: "tertiaryColor")
}

//MARK: - Font
class FontName: NSObject {
    static let Bold = "-Bold"
    static let Medium = "-Medium"
    static let MediumItalic = "-MediumItalic"
    static let Regular = "-Regular"
    static let SemiBold = "-SemiBold"
}
class NotificationData: NSObject{
    static let notificationStateKeyHealthChat = "NotificationStateKeyHealthChat"
    
}

class FontSize: NSObject {
    static let fontRSize = 0.055 * DeviceConstant.screenWidth as CGFloat
}

//MARK: - Date Format
class strDateFormat: NSObject {
    //"yyyy-MM-dd'T'HH:mm:ssZ" //2021-03-09T11:00:00+00:00
    static let old = "yyyy-MM-dd'T'HH:mm:ss"
    static let new = "dd MMM yyyy  hh:mm a"
}

//MARK: - Device
class DeviceConstant: NSObject {
    static let is_iPad = UIUserInterfaceIdiom.pad
    static let is_iPhone = UIUserInterfaceIdiom.phone
    static let screenWidth = (UIScreen.main.bounds.size.width)
    static let screenHeight = (UIScreen.main.bounds.size.height)
    static let window = UIApplication.shared.windows.first!
    static let topPadding = window.safeAreaInsets.top
}

class AppInfo: NSObject {
    static let AppName = Bundle.appName()
    static let AppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "n/a"
    static let BundleID = Bundle.main.bundleIdentifier
}

//MARK: - Error
class ErrorName: NSObject {
    static let productsUnavailable = "Products are not available at this moment. Stay tuned."
    static let purchaseDisabled = "Purchases are disabled in your devices"
    static let restoreFailed = "Restore Failed"
    static let nothingToRestore = "Nothing to Restore"
    static let restoreSuccess = "Restore Success"
    static let mapAddress = "Select a proper address"
    static let noInternetConnection = "Check your internet connection."
    static let errorMsg = "Something went wrong. Please check your internet connection."
    static let emptyMobileNo = "Enter a mobile number"
    static let validMobileNo = "Enter a valid mobile number"
    static let emptyEmail = "Enter your email address"
    static let validEmail = "Enter a valid email address"
    static let emptyPwd = "Enter a password"
    static let emptyConfirmPwd = "Enter a confirm password"
    static let shortPwd = "Password should be at least 10 characters long"
    static let notMatchPwd = "Password and confirm password does not match"
    static let incorrectOTP = "Enter correct passcode"
    static let emptyUsername = "Enter a username"
    static let displayName = "Enter a valid display name"
    static let emptyName = "Enter a name"
    static let emptyFName = "Enter first name"
    static let emptyLName = "Enter last name"
    static let emptySubject = "Enter subject"
    static let subjectRange = "Subject character range should not be more than 30"
    static let enoughTokens = "You do not have enough tokens"
    static let emptyDesc = "Enter description"
    static let notAgreed = "Accept agreement and terms"
    static let selectGender = "Select gender"
    static let selectEthnicity = "Select ethnicity"
    static let selectPrimaryGoal = "Select primary goal"
    static let selectProblem = "Select at least one option"
    static let healthKitAuth = "An error occured. Make sure you have authorized Apple Health permissions."
    static let spO2NotSupported = "Unable to get oxygen saturation on this device"
    static let sessionExpired = "Session is expired. Close the app and relaunch."
    static let userExist = "User already exists"
    static let userExist1 = "PreSignUp failed with error A participant already exists with this email address."
    static let userExist2 = "An account with the given email already exists."
    static let imageUploadError = "Failed to upload image."
    static let imageAccessError = "We don't have access to your Photos."
}
// MARK: - View Controller
enum AppStoryboard: String {
    case Main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    func initalViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    static func instantAppStoryboard(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

//MARK: - ImageAsset
class ImageAsset: NSObject {
    static let imgName = UIImage(named: "ic_img_name")

}
