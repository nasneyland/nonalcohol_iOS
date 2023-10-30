//
//  LoginView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    @ObservedObject public var vm: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                VStack {
                    Text("안녕하세요\n이름을 입력해주세요.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        TextField("닉네임", text: $vm.user.nickname)
                        Text("님")
                    }
                }
                Button(action: {
                    if !vm.user.nickname.isEmpty {
                        vm.saveUserNickname()
                        mainRouter.checkLogined()
                    }
                }, label: {
                    Text("입장하기")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                .buttonStyle(CustomButtonStyle(isActive: !vm.user.nickname.isEmpty))
                
                NavigationLink(destination: RestoreView(vm: mainRouter.appDI.restoreDependencies())) {
                    Text("데이터 복구를 원하시나요?")
                }
                
                Spacer()
            }
            .padding(25)
        }
    }
}
