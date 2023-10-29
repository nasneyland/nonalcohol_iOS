//
//  ContainerView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import SwiftUI

struct ContainerView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    var body: some View {
        ZStack {
            if mainRouter.isLogined {
                LazyView(HomeView(vm: mainRouter.appDI.homeDependencies()))
            } else {
                LazyView(LoginView(vm: mainRouter.appDI.loginDependencies()))
            }
        }
        .onAppear {
            mainRouter.checkLogined()
        }
    }
}

struct LazyView <Content : View> : View {
    let build : ()-> Content
    init (_ build : @autoclosure  @escaping ()-> Content) {
        self.build = build
    }
    var body : Content {
        build ()
    }
}
