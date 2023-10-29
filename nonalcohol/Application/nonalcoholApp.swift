//
//  nonalcoholApp.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import SwiftUI

@main
struct nonalcoholApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environmentObject(MainRouter(appDI: AppDI.shared))
        }
    }
}
