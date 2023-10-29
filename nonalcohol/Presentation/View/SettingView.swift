//
//  SettingView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/19.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    @ObservedObject public var vm: SettingViewModel
    
    var body: some View {
        Text("로그아웃")
            .onTapGesture {
                vm.deleteUserInfo()
                mainRouter.checkLogined()
            }
    }
}
