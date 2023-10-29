//
//  AppDelegate.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared: AppDelegate {
        return (UIApplication.shared.delegate as! AppDelegate)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // sceneDelegate 연결
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}
