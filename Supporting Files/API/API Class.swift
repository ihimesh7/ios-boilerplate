//
//  API Class.swift
//  Hearty
//
//  Created by Himesh Mistry on 9/24/21.
//
import UIKit
    
class ServiceKey {
    static let baseURL = Bundle.infoPlistValue(forKey: "BaseURL") as! String
    
}

struct APIName {
    static let name = "name"
    
}

struct StreamChat {
    static let apiKey = String(Bundle.infoPlistValue(forKey: "streamAPIkey") as? String ?? "").replacingOccurrences(of: "\"", with: "")
}

extension Bundle {
    static func infoPlistValue(forKey key: String) -> Any? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) else {
            return nil
        }
        return value
    }
}
