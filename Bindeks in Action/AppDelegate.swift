//
//  AppDelegate.swift
//  Bindeks in Action
//
//  Created by Volodymyr Khmil on 1/30/17.
//  Copyright © 2017 Volodymyr Khmil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = Rout.initial(initial: BindeksRouter.initial)
        self.window?.makeKeyAndVisible()
        return true
    }
}

