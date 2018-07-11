//
//  AppDelegate.swift
//  SwiftProtocolInjection
//
//  Created by Grant Davis on 7/10/18.
//  Copyright © 2018 Grant Davis Interactive, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate var mainApplication: Application!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        mainApplication = Application()
        return true
    }
}

// private access to the typed app delegate
private var appDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

// extend the protocol to provide the hidden data service object
extension HasDataStore {
    var dataStore: DataStoreService {
        return appDelegate.mainApplication.dataService
    }
}

// provide extension to present global alerts from the root VC
extension AlertPresenter {
    func showAlert(for message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nice!", style: .default, handler: nil))
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
