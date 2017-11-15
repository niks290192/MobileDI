//
//  AppHelper.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 13/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import Foundation
import UIKit


class AppHelper:NSObject {
	class var sharedInstance : AppHelper {
		struct Singleton{
			static let instance = AppHelper()
		}
		return Singleton.instance
	}

	class func saveToUserDefault(value:String, key:String) {
		UserDefaults.standard.set(value, forKey:key)
		UserDefaults.standard.synchronize()
	}

	class func userDefaultForKey(key:String) -> String {
		var optional:String?
		optional = UserDefaults.standard.object(forKey: key) as? String
		if (optional != nil) {
			return UserDefaults.standard.object(forKey: key) as! NSString as String
		} else {
			return ""
		}
	}

	class func removeFromUserDefault(value:String) {
		UserDefaults.standard.removeObject(forKey: value)
		UserDefaults.standard.synchronize()
	}

	class func checkForInternetConnection()-> Bool {
		let reachability:Reachability = Reachability.forInternetConnection()
		let networkStatus:NetworkStatus = reachability.currentReachabilityStatus()
		if networkStatus == NetworkStatus.NotReachable {
			return false
		} else {
			return true
		}
	}

	class func isValidEmail(testStr:String) -> Bool {
		print("validate emilId: \(testStr)")
		let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		let result = emailTest.evaluate(with: testStr)
		return result
	}

	class func openURL(Url:String) {
		guard let url = URL(string: "\(Url)") else {
			return
		}

		if #available(iOS 10.0, *) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		} else {
			UIApplication.shared.openURL(url)
		}
	}
}
