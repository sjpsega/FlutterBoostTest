//
//  AppDelegate.swift
//  FlutterBoostTest
//
//  Created by sjp on 2024/12/13.
//

import UIKit
import flutter_boost

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //创建代理，做初始化操作
        let delegate = BoostDelegate()
        FlutterBoost.instance().setup(application, delegate: delegate) { engine in

        }
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white

        //设置root
        let rootVC = ViewController()
        let navVC = UINavigationController(rootViewController:rootVC)
        
        self.window!.rootViewController = navVC
        self.window!.makeKeyAndVisible()

        return true

    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

